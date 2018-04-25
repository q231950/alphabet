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
    
    func setupTopViewController()
    func setupBottomViewController()
}

extension TopBottomViewControllerContaining {
    
    func setupTopViewController() {
        guard let subview = topViewController?.view else {
            return
        }
        view.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: view.topAnchor),
            subview.rightAnchor.constraint(equalTo: view.rightAnchor),
            subview.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
    
    func setupBottomViewController() {
        guard let bottomViewController = bottomViewController, let topViewController = topViewController else {
            print("top/bottom view controllers need to be set for TopBottomContainerViewController")
            return
        }
        addChildViewController(bottomViewController)
        view.addSubview(bottomViewController.view)
        bottomViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomViewController.view.topAnchor.constraint(equalTo: topViewController.view.bottomAnchor),
            bottomViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}
