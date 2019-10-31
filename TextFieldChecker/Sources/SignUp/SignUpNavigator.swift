//
//  SignNavigator.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

protocol SignUpNavigatorType {
    func back()
}

final class SignUpNavigator: SignUpNavigatorType {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func back() {
        
    }
}
