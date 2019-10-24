//
//  ViewController.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/22.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.white
        setUpView()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private lazy var label:UILabel = {
       let label = UILabel()
        label.text = "とりまAutolayoutテスト"
        label.textColor = UIColor.red
        label.frame = view.frame
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension TopViewController {
    private func setUpView() {
        view.addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

