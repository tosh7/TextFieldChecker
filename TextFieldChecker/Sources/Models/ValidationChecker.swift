//
//  ValidationChecker.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/11/01.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class ValidationChecker {
    
    static func validateEmail(_ email: String) -> Validation {
        if email.isEmpty {
            return .empty
        } else {
            if email.isEmail {
                return .error(with: "無効なEmailです")
            } else {
                return .success
            }
        }
    }
    
    static func validatePassword(_ password: String) -> Validation {
        if password.isEmpty {
            return .empty
        } else {
            var messages: [String] = []
            if !password.hasCharactor {
                messages.append("・半角英字を含めてください")
            }
            if !password.hasNumber {
                messages.append("・数字を含めてください")
            }
            if !password.eightDigit {
                messages.append("・8文字以上にしてください")
            }
            
            if messages.count > 0 {
                let labelText = messages.joined(separator: "\n")
                return .error(with: labelText)
            }
            return .success
        }
    }
}
