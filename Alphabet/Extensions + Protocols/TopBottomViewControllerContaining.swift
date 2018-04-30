//
//  CharacterSelectable.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 25.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

protocol TopBottomViewControllerContaining where Self: UIViewController {
    associatedtype TopViewController: UIViewController
    var topViewController: TopViewController? { get }
    
    associatedtype BottomViewController: UIViewController
    var bottomViewController: BottomViewController? { get }
    
    func setupViewControllers()
}

extension TopBottomViewControllerContaining {
    
    func setupViewControllers() {
        setupTopViewController()
        setupBottomViewController()
    }
    
    private func setupTopViewController() {
        guard let topViewController = topViewController, let subview = topViewController.view else {
            return
        }
        addChildViewController(topViewController)
        view.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ])
    }
    
    private func setupBottomViewController() {
        guard let bottomViewController = bottomViewController, let topViewController = topViewController else {
            print("top/bottom view controllers need to be set for TopBottomContainerViewController")
            return
        }
        addChildViewController(bottomViewController)
        view.addSubview(bottomViewController.view)
        bottomViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomViewController.view.topAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.bottomAnchor),
            bottomViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ])
    }
}
