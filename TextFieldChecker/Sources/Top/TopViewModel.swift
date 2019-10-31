//
//  TopViewModel.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/22.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TopViewModelInputs {
    
}

protocol TopViewModelOutputs {
    
}

protocol TopViewModelType {
    var inputs: TopViewModelInputs { get }
    var outputs: TopViewModelOutputs { get }
}

final class TopViewModel: TopViewModelType, TopViewModelInputs, TopViewModelOutputs {
    init() {}
    
    var inputs: TopViewModelInputs { return self }
    var outputs: TopViewModelOutputs { return self }
}
