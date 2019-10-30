//
//  Application.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()
    var window: UIWindow?
    var rootViewController: RootViewController? {
        return window?.rootViewController as? RootViewController
    }
    
    private init() {}
    
    func setUp(in window: UIWindow) {
        let navigator = RootNavigator(window: window)
        let viewModel = RootViewModel()
        let viewController = RootViewController(viewModel: viewModel,
                                                navigator: navigator)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
