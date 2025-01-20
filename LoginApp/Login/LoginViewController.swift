//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class LoginViewController: UIViewController {

    private var loginScreen = LoginScreen()
    
    override func loadView() {
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen.delegate(delegate: self)
        self.loginScreen.configTextFieldDelegate(delegate: self)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func actionLoginGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("Erro ao obter clientID do Firebase")
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard let self = self else { return }

            if let error = error {
                print("Erro ao realizar login: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print("Erro ao obter usuário ou token")
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Erro ao autenticar com Firebase: \(error.localizedDescription)")
                    return
                }
                print("Usuário autenticado com sucesso: \(authResult?.user.email ?? "Sem e-mail")")
            }
        }
    }



    
    func actionLoginApple() {
        let fakeUser = ["name": "John Doe", "email": "john.doe@example.com"]
            print("Login com Apple simulado no ViewController: \(fakeUser)")
    }
    
    func actionLoginButton() {
    }

    func actionRegisterButton() {
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
