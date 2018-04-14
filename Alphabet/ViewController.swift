//
//  ViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let characterView: CharacterView = UIView.fromNib()
    private let characterSelectionViewController = CharacterSelectionViewController()
    private var expandedCharacterViewConstraint: NSLayoutConstraint!
    private var collapsedCharacterViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTapGestureRecognizer()
        
        setupCharacterView()
        setupCharacterSelectionViewController()
        
        layoutCharacterViews()
        expandCharacterView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        characterView.characterViewModel = CharacterViewModel(character: "α", name: "alpha".localizedLowercase)
    }
    
    private func registerTapGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(sender:)))
        tapRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        toggleCharacterViewState()
    }
    
    private func toggleCharacterViewState() {
        animate {
            if self.expandedCharacterViewConstraint.isActive {
                self.collapseCharacterView()
            } else {
                self.expandCharacterView()
            }
        }
    }
    
    private func animate(animations: @escaping () -> Swift.Void) {
        UIView.animate(withDuration: 0.3) {
            animations()
            self.view.layoutIfNeeded()
        }
    }
    
    private func expandCharacterView() {
        NSLayoutConstraint.deactivate([collapsedCharacterViewConstraint])
        NSLayoutConstraint.activate([expandedCharacterViewConstraint])
    }
    
    private func collapseCharacterView() {
        NSLayoutConstraint.deactivate([expandedCharacterViewConstraint])
        NSLayoutConstraint.activate([collapsedCharacterViewConstraint])
    }
    
    private func layoutCharacterViews() {
        expandedCharacterViewConstraint = NSLayoutConstraint(item: characterView, attribute: .height, relatedBy: .equal, toItem: characterSelectionViewController.view, attribute: .height, multiplier: 1.6, constant: 0)
        collapsedCharacterViewConstraint = NSLayoutConstraint(item: characterSelectionViewController.view, attribute: .height, relatedBy: .equal, toItem: characterView, attribute: .height, multiplier: 1.6, constant: 0)
    }
    
    private func setupCharacterView() {
        view.addSubview(characterView)
        characterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.topAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
    
    private func setupCharacterSelectionViewController() {
        addChildViewController(characterSelectionViewController)
        view.addSubview(characterSelectionViewController.view)
        characterSelectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterSelectionViewController.view.topAnchor.constraint(equalTo: characterView.bottomAnchor),
            characterSelectionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterSelectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterSelectionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}

