//
//  RootViewController.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController, ContainerViewContent {
    init(viewModel: RootViewModelType, navigator: RootNavigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private let viewModel: RootViewModelType
    private let navigator: RootNavigatorType
    var containerView: UIView = {
        let view = UIView()
        return view
    }()
    weak var currentViewController: UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.navigator.toTop()
        }
    }
}
