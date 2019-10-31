//
//  SignUpViewModel.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SignUpViewModelInputs {
    func emailTextFieldDidChange(_ email: String)
    func passwordTextFieldDidChange(_ password: String)
    func register()
}

protocol SignUpViewModelOutputs {
    var emailValidation: Driver<Validation> { get }
    var passwordvalidation: Driver<Validation> { get }
    var registerEnabled: Driver<Bool> { get }
}

protocol SignUpViewModelType {
    var inputs: SignUpViewModelInputs { get }
    var outputs: SignUpViewModelOutputs { get }
}

final class SignUpViewModel: SignUpViewModelType, SignUpViewModelInputs, SignUpViewModelOutputs {
    init() {
        let validEmail = emailProperty.map { email -> Validation in
                return ValidationChecker.validateEmail(email)
        }
        let validPassword = passwordProperty.map { password -> Validation in
                return ValidationChecker.validatePassword(password)
        }
        emailValidation = validEmail.asDriver { _ in
            Driver.empty()
        }
        passwordvalidation = validPassword.asDriver { _ in
            Driver.empty()
        }
        registerEnabled = Observable.combineLatest(
            validEmail,
            validPassword
        ) { email, password in
            email.isValid && password.isValid
        }.asDriver { _ in
            Driver.empty()
        }
    }
    
    private let emailProperty = BehaviorRelay<String>(value: "")
    func emailTextFieldDidChange(_ email: String) {
        emailProperty.accept(email)
    }
    
    private let passwordProperty = BehaviorRelay<String>(value: "")
    func passwordTextFieldDidChange(_ password: String) {
        passwordProperty.accept(password)
    }
    
    private let registerProperty = PublishSubject<Void>()
    func register() {
        registerProperty.onNext(())
    }
    
    let emailValidation: Driver<Validation>
    let passwordvalidation: Driver<Validation>
    let registerEnabled: Driver<Bool>
    var inputs: SignUpViewModelInputs { return self }
    var outputs: SignUpViewModelOutputs { return self }
}
