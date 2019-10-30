//
//  RootViewModel.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol RootViewModelInput {
    
}

protocol RootViewModelOutput {
    
}

protocol RootViewModelType {
    var inputs: RootViewModelInput { get }
    var outputs: RootViewModelOutput { get }
}

final class RootViewModel: RootViewModelType, RootViewModelInput, RootViewModelOutput {
    init() {}
    
    var inputs: RootViewModelInput { return self }
    var outputs: RootViewModelOutput { return self }
}
