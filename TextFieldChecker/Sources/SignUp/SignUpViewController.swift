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
    case error(message: String, count: Int?)
    case empty
}

extension Validation {
    var isValid: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
}

final class SignUpViewController: UIViewController {
    init(viewModel: SignUpViewModelType, navigator: SignUpNavigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.saketify.backGroundColor
        setUpView()
        self.title = "新規登録"
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.barTintColor = UIColor.saketify.beerYellow
        navigationController?.navigationBar.tintColor = UIColor.saketify.backGroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.saketify.backGroundColor]
    }
    
    private let disosedBag = DisposeBag()
    private let viewModel: SignUpViewModelType
    private let navigator: SignUpNavigatorType
    private var emailValidation: Validation = .empty
    private var passwordValidation: Validation = .empty
    
    private var emailTextField: CustomTextFieldView = {
        let view = CustomTextFieldView()
        view.textField.placeholder = "メールアドレス"
        view.label.text = "メールアドレスが正しくありません"
        view.label.textColor = UIColor.red
        view.label.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var passwordTextField: CustomTextFieldView = {
        let view = CustomTextFieldView()
        view.textField.placeholder = "Password"
        view.label.text = "＊英文字と数字を入れ8文字以上"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.isSecureTextEntry = true
        return view
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor.saketify.beerYellow
        button.alpha = 0.3
        button.isEnabled = false
        button.layer.cornerRadius = 18
        return button
    }()
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
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40).isActive = true
        
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
