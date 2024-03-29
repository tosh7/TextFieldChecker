//
//  TopNavigator.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

protocol TopNavigatorType {
    func toSignUp()
}

final class TopNavigator: TopNavigatorType {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func toSignUp() {
        let navigator = SignUpNavigator(navigationController: navigationController)
        let viewModel = SignUpViewModel()
        let viewController = SignUpViewController(viewModel: viewModel,
                                                  navigator: navigator)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
