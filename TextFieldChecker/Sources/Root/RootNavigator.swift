//
//  RootNavigator.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

protocol RootNavigatorType {
    
}

final class RootNavigator: RootNavigatorType {
    private weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
}
