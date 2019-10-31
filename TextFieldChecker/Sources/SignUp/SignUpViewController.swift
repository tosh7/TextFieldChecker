//
//  SignUpViewController.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Validation {
    case success
    case error(with: String)
    case empty
}

final class SignUpViewController: UIViewController {
    init(viewModel: SignUpViewModelType, navigator: SignUpNavigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.white
        setUpView()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private let viewModel: SignUpViewModelType
    private let navigator: SignUpNavigatorType
    private var emailValidation: Validation = .empty
    private var passwordValidation: Validation = .empty
    
    private var emailTextField: CustomTextFieldView = {
        let view = CustomTextFieldView()
        view.textField.placeholder = "ここはplacefolder"
        view.label.text = "ここにもきちんと文字が出るのかを確認"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var passwordTextField: CustomTextFieldView = {
        let view = CustomTextFieldView()
        view.textField.placeholder = "このTextFieldはPasswprd用"
        view.label.text = "ここにきちんと文字が出るかを確認"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(registerButtonTapped),
                         for: .touchUpInside)
        button.titleLabel?.text = "登録"
        button.isEnabled = false
        button.backgroundColor = UIColor.red
        return button
    }()
    
    @objc func registerButtonTapped() {
        print("REGISTER")
    }
}

extension SignUpViewController {
    private func setUpView() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
