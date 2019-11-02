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
    
}

protocol SignUpViewModelOutputs {
    
}

protocol SignUpViewModelType {
    var inputs: SignUpViewModelInputs { get }
    var outputs: SignUpViewModelOutputs { get }
}

final class SignUpViewModel: SignUpViewModelType, SignUpViewModelInputs, SignUpViewModelOutputs {
    init() {
        
    }
    
    var inputs: SignUpViewModelInputs { return self }
    var outputs: SignUpViewModelOutputs { return self }
}
