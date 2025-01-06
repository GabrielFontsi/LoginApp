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
        let textField = IconTextField(icon: UIImage(systemName: "person"))
        textField.setCardShadow()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu Email:"
        textField.textColor = .darkGray
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = IconTextField(icon: UIImage(systemName: "key"))
        textField.setCardShadow()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha:"
        textField.textColor = .darkGray
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setShadowButton(button: button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .systemFill
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta ? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        button.setTitleColor(.black, for: .normal)
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
        let button = UIButton()
        button.setShadowButton(button: button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Ajustando o tamanho da imagem que está no botão
        if let originalImage = UIImage(named: "GoogleIcon") {
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 25, height: 25)).image { _ in
                originalImage.draw(in: CGRect(origin: .zero, size: CGSize(width: 25, height: 25)))
            }
            button.setImage(resizedImage, for: .normal)
        }
       
        button.setTitle(" Sing in with Google", for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -10, bottom: 5, right: 0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginAppleButton: UIButton = {
        let button = UIButton()
        button.setShadowButton(button: button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Ajustando o tamanho da imagem que está no botão
        if let originalImage = UIImage(named: "AppleIcon") {
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 25, height: 25)).image { _ in
                originalImage.draw(in: CGRect(origin: .zero, size: CGSize(width: 25, height: 25)))
            }
            button.setImage(resizedImage, for: .normal)
        }
        
        button.setTitle("  Sing in with Apple", for: .normal)
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -10, bottom: 5, right: 0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()

    
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
