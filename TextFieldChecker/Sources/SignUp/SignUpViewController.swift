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
    
    private var emailTextField: CustomTextFieldView = {
        let view = CustomTextFieldView()
        view.textField.placeholder = "ここはplacefolder"
        view.label.text = "ここにもきちんと文字が出るのかを確認"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

extension SignUpViewController {
    private func setUpView() {
        view.addSubview(emailTextField)
        
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
//        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
