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
    
    private let backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "main_img")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let waveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wave")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}

extension TopViewController {
    private func setUpView() {
        view.addSubview(backGroundImageView)
        view.addSubview(waveImageView)
        
        backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        waveImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        waveImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        waveImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

