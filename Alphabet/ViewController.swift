//
//  ViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension ViewController: CharacterSelectable {
    func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel) {
        print("didSelectCharacter(\(characterViewModel.character))")
        characterSelectionViewController.select(character: characterViewModel)
        characterView.characterViewModel = characterViewModel
        view.layoutIfNeeded()
        animate {
            self.expandCharacterView()
        }
    }
}

class ViewController: UIViewController {
    
    private let characterView = CharacterView()
    private var characterSelectionViewController: CharacterSelectionViewController!
    private var expandedCharacterViewConstraint: NSLayoutConstraint!
    private var collapsedCharacterViewConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterSelectionViewController = CharacterSelectionViewController(alphabet: .greek, characterSelectable: self)
        
        registerTapGestureRecognizer()
        
        setupCharacterView()
        setupCharacterSelectionViewController()
        
        layoutCharacterViews()
        expandCharacterView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let character = CharacterViewModel(character: "α", name: "alpha".localizedLowercase)
        characterView.characterViewModel = character
        characterSelectionViewController.select(character: character)
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
            if self.expandedCharacterViewConstraint.isActive { //self.heightConstraint.constant == 200
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
//        heightConstraint.constant = 200
        NSLayoutConstraint.deactivate([collapsedCharacterViewConstraint])
        NSLayoutConstraint.activate([expandedCharacterViewConstraint])
    }
    
    private func collapseCharacterView() {
//        heightConstraint.constant = 80
        NSLayoutConstraint.deactivate([expandedCharacterViewConstraint])
        NSLayoutConstraint.activate([collapsedCharacterViewConstraint])
    }
    
    private func layoutCharacterViews() {
        expandedCharacterViewConstraint = NSLayoutConstraint(item: characterView, attribute: .height, relatedBy: .equal, toItem: characterSelectionViewController.view, attribute: .height, multiplier: 4, constant: 0)
        collapsedCharacterViewConstraint = NSLayoutConstraint(item: characterSelectionViewController.view, attribute: .height, relatedBy: .equal, toItem: characterView, attribute: .height, multiplier: 4, constant: 0)
        
        heightConstraint = NSLayoutConstraint(item: characterView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//        heightConstraint.isActive = true
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

