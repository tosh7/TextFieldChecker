//
//  CustomTextFieldView.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class CustomTextFieldView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 10
        distribution = .fill
        
        addArrangedSubview(textField)
        addArrangedSubview(label)
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    required init(coder: NSCoder) { fatalError() }
    
    lazy var textField: PaddingTextField = {
        let textField = PaddingTextField()
        return textField
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        return label
    }()
}
