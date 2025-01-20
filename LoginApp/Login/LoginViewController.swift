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
        AuthService.shared.signInWithGoogle(presentingVC: self) { [weak self] result in
                    guard let self = self else { return }

                    switch result {
                    case .success(let user):
                        print("Usuário autenticado com sucesso: \(user.email ?? "Sem e-mail")")
                        let homeVC = HomeViewController()
                        self.navigationController?.pushViewController(homeVC, animated: true)
                    case .failure(let error):
                        print("Erro ao realizar login com Google: \(error.localizedDescription)")
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
