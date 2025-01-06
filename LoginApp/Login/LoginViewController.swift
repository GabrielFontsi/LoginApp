//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginScreen = LoginScreen()
    
    override func loadView() {
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

