//
//  AuthService.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 20/01/25.
//

import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class AuthService {
    static let shared = AuthService()

    private init() {}

    /// Método para login com Google
    func signInWithGoogle(presentingVC: UIViewController, completion: @escaping (Result<User, Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(NSError(domain: "AuthService", code: 400, userInfo: [NSLocalizedDescriptionKey: "Erro ao obter clientID do Firebase"])))
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                completion(.failure(NSError(domain: "AuthService", code: 401, userInfo: [NSLocalizedDescriptionKey: "Erro ao obter usuário ou token"])))
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                } else if let user = authResult?.user {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError(domain: "AuthService", code: 402, userInfo: [NSLocalizedDescriptionKey: "Erro desconhecido ao autenticar usuário"])))
                }
            }
        }
    }
}
