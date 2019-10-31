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
    var registerButtonIsEnabled: Driver<Bool> { get }
}

protocol SignUpViewModelType {
    var inputs: SignUpViewModelInputs { get }
    var outputs: SignUpViewModelOutputs { get }
}

final class SignUpViewModel: SignUpViewModelType, SignUpViewModelInputs, SignUpViewModelOutputs {
    init() {
        emailValidation = emailProperty
            .filter { !$0.isEmpty }
            .map { email -> Validation in
                return .success
        }.asDriver(onErrorJustReturn: .error(with: "謎のエラー"))
        passwordvalidation = passwordProperty
            .filter { !$0.isEmpty }
            .map { password -> Validation in
                return .success
        }.asDriver(onErrorJustReturn: .error(with: "謎のエラー"))
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
    let registerButtonIsEnabled: Driver<Bool>
    var inputs: SignUpViewModelInputs { return self }
    var outputs: SignUpViewModelOutputs { return self }
}
