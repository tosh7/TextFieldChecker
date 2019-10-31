//
//  ViewController.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/22.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController {
    
    init(viewModel: TopViewModelType, navigator: TopNavigatorType) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.white
        setUpView()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    let navigator: TopNavigatorType
    let viewModel: TopViewModelType
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
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
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(signUpButtonTapped),
                         for: .touchUpInside)
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = UIColor.saketify.beerYellow
        button.layer.cornerRadius = 18
        return button
    }()
    
    @objc func signUpButtonTapped() {
        print("Tapped")
        navigator.toSignUp()
    }
}

extension TopViewController {
    private func setUpView() {
        view.addSubview(backGroundImageView)
        view.addSubview(waveImageView)
        view.addSubview(signUpButton)
        
        backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        waveImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        waveImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        waveImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

