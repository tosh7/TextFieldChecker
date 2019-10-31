//
//  String+Extension.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/11/01.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

extension String {
    var isEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    var isPassword: Bool {
        let passwordRegex = "(?=.*?[a-z])(?=.*?[0-9]).{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    var hasCharactor: Bool {
        let charactorRegex = "(?=.*?[a-z]).{1,}"
        return NSPredicate(format: "SELF MATCHES %@", charactorRegex).evaluate(with: self)
    }
    
    var hasNumber: Bool {
        let passwordRegex = "(?=.*?[0-9]).{1,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    var eightDigit: Bool {
        let passwordRegex = "(?=.*?).{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
