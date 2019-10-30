//
//  RootViewController.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    init(viewModel: RootViewModelType, navigator: RootNavigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private let viewModel: RootViewModelType
    private let navigator: RootNavigatorType
}
