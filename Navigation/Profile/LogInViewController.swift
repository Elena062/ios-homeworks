//
//  LogInViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена Николаевна on 25/09/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let logInView = UIView()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Image")
        return imageView
    }()
    
    var loginTextField: UITextField = {
        let login = UITextField()
        login.font = .systemFont(ofSize: 16)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.autocapitalizationType = .none
        login.textColor = .black
        login.placeholder = "Email or phone"
        login.backgroundColor = .systemGray6
        return login
    }()
    
    var passwordTextField: UITextField = {
         let password = UITextField()
         password.font = .systemFont(ofSize: 16)
         password.translatesAutoresizingMaskIntoConstraints = false
         password.autocapitalizationType = .none
         password.textColor = .black
         password.placeholder = "Password"
         password.backgroundColor = .systemGray6
         password.isSecureTextEntry = true
         return password
     }()
    
    
    var logInButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        let buttonImage = UIImage(imageLiteralResourceName: "blue_pixel")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.setBackgroundImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logInView.layer.cornerRadius = 10
        logInView.clipsToBounds = true
        logInView.layer.borderColor = UIColor.lightGray.cgColor
        logInView.layer.borderWidth = 0.5
        logInView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        
        switch logInButton.state {
        case .normal:
            logInButton.alpha = 1
        case .disabled:
            logInButton.alpha = 0.8
        case .selected:
            logInButton.alpha = 0.8
        case .highlighted:
            logInButton.alpha = 0.8
        default:
            logInButton.alpha = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
     
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    override func viewDidDisappear (_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
 
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        logInView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(logoImageView)
        containerView.addSubview(logInView)
        containerView.addSubview(logInButton)
        
 //       logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        logInView.addSubview(loginTextField)
        logInView.addSubview(passwordTextField)
        
    }
    
    @objc func logInButtonTapped() {
        let profVC = ProfileViewController()
        self.navigationController?.pushViewController(profVC, animated: true)
        loginTextField.text = ""
        passwordTextField.text = ""
        view.endEditing(true)
     }
    
    
    private func setupConstraints(){
        let constraints = [
        
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
               
            logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            logInView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            logInView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            logInView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            logInView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.leadingAnchor.constraint(equalTo: logInView.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: logInView.trailingAnchor),
            loginTextField.topAnchor.constraint(equalTo: logInView.topAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: logInView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: logInView.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: logInView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

extension LogInViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
       
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}
