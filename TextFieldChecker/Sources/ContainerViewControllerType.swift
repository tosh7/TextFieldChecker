//
//  ContainerViewControllerType.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

protocol ContainerViewContent: class {
    var containerView: UIView { get }
    var currentViewController: UIViewController? { get set }
    func setContainerContent(_ viewController: UIViewController)
}

extension ContainerViewContent where Self: UIViewController {
    func setContainerContent(_ viewController: UIViewController) {
        if currentViewController == nil {
            setInitialViewController(viewController)
        } else {
            switchToViewController(viewController)
        }
    }
    
    private func setInitialViewController(_ viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        currentViewController = viewController
    }
    
    private func switchToViewController(_ viewController: UIViewController,
                                        duration: TimeInterval = 0.0,
                                        options: UIView.AnimationOptions = [],
                                        completion: (() -> Void)? = nil) {
        guard let currentViewController = currentViewController else { return }
        currentViewController.willMove(toParent: nil)
        addChild(viewController)
        currentViewController.view.layer.zPosition = 1
        viewController.view.alpha = 1.0
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.view.isUserInteractionEnabled = false
        transition(from: currentViewController,
                   to: viewController,
                   duration: duration,
                   options: options,
                   animations: { [currentViewController] in
                    currentViewController.view.alpha = 0.0
            }, completion: { [weak self] _ in
                guard let self = self else { return }
                currentViewController.view.removeFromSuperview()
                currentViewController.removeFromParent()
                viewController.didMove(toParent: self)
                self.currentViewController = viewController
                viewController.view.isUserInteractionEnabled = true
                completion?()
        })
    }
}
