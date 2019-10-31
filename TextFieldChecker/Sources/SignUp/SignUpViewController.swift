//
//  SignUpViewController.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {
    init(viewModel: SignUpViewModelType, navigator: SignUpNavigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private let viewModel: SignUpViewModelType
    private let navigator: SignUpNavigatorType
}
