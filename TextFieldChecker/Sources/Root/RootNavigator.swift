//
//  RootNavigator.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

protocol RootNavigatorType {
    func toTop()
}

final class RootNavigator: RootNavigatorType {
    private weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    private var rootViewController: RootViewController? {
        return window?.rootViewController as? RootViewController
    }
    
    func toTop() {
        let navigationController = UINavigationController()
        let navigator = TopNavigator(navigationController: navigationController)
        let viewModel = TopViewModel()
        let viewController = TopViewController(viewModel: viewModel,
                                               navigator: navigator)
        navigationController.viewControllers = [viewController]
        rootViewController?.setContainerContent(navigationController)
    }
}
