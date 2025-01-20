//
//  LoginScreen.swift
//  LoginApp
//
//  Created by Gabriel Fontenele da Silva on 01/01/25.
//

import UIKit

protocol LoginScreenProtocol:AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
    func actionLoginApple()
    func actionLoginGoogle()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login Aplicativo"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField().createTextField(
            placeholder: "Digite seu Email:",
            backgroundColor: .white,
            textColor: .darkGray,
            isSecure: false,
            icon: UIImage(systemName: "person")
        )
        textField.setCardShadow()
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField().createTextField(
            placeholder: "Digite sua senha:",
            backgroundColor: .white,
            textColor: .darkGray,
            isSecure: true,
            icon: UIImage(systemName: "key")
        )
        textField.setCardShadow()
        return textField
    }()
    
    
    private lazy var loginButton: UIButton = {
        let button = UIButton().createButton(
            title: "Login",
            backgroundColor: .systemFill,
            titleColor: .black,
            cornerRadius: 7.5,
            ofsize: 18,
            uiFonte: .medium)
        button.setShadowButton(button: button)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    private lazy var registerButton: UIButton = {
        let button = UIButton().createButton(
            title: "Não tem conta ? Cadastre-se",
            backgroundColor: .clear,
            titleColor: .black,
            cornerRadius: 7.5,
            ofsize: 18,
            uiFonte: .medium)
        button.setShadowButton(button: button)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginGoogleButton,loginAppleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    
    
    private lazy var loginGoogleButton: UIButton = {
        let button = UIButton().createButton(
            title: "Sign in with Google",
            backgroundColor: .black,
            titleColor: .white,
            cornerRadius: 7.5,
            ofsize: 18,
            uiFonte: .medium,
            icon: UIImage(named: "GoogleIcon"),
            iconSize: CGSize(width: 25, height: 25),
            imageEdgeInsets: UIEdgeInsets(top: 5, left: -10, bottom: 5, right: 0))
        button.setShadowButton(button: button)
        button.addTarget(self, action: #selector(self.tappedGoogleButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedGoogleButton(){
        self.delegate?.actionLoginGoogle()
    }
    
    private lazy var loginAppleButton: UIButton = {
        let button = UIButton().createButton(
            title: "Sign in with Apple",
            backgroundColor: .white,
            titleColor: .black,
            cornerRadius: 7.5,
            ofsize: 18,
            uiFonte: .medium,
            icon: UIImage(named: "AppleIcon"),
            iconSize: CGSize(width: 25, height: 25),
            imageEdgeInsets: UIEdgeInsets(top: 5, left: -10, bottom: 5, right: 0))
        button.setShadowButton(button: button)
        button.addTarget(self, action: #selector(self.tappedAppleButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedAppleButton(){
        self.delegate?.actionLoginApple()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupSubView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor.systemGray6
    }
    
    private func setupSubView(){
        self.addSubview(self.logoLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.loginStackView)
        self.addSubview(self.registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.logoLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.logoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoLabel.bottomAnchor, constant: 32),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 18),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 32),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginStackView.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginStackView.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginStackView.bottomAnchor, constant: 18),
            self.registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginGoogleButton.heightAnchor.constraint(equalToConstant: 44),
            self.loginAppleButton.heightAnchor.constraint(equalTo: self.loginGoogleButton.heightAnchor)
        ])
    }
}
