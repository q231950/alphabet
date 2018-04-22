//
//  AlphabetViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 22.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension AlphabetViewController: CharacterSelectable {
    func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel) {
        characterSelectionViewController.select(character: characterViewModel)
        characterView.characterViewModel = characterViewModel
        view.layoutIfNeeded()
    }
}

class AlphabetViewController: UIViewController {
    
    private let characterView = CharacterView()
    private var characterSelectionViewController: CharacterSelectionViewController!
    private var panOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterSelectionViewController = CharacterSelectionViewController(alphabet: .scientific, characterSelectable: self)
        
        setupCharacterView()
        setupCharacterSelectionViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let character = CharacterViewModel(character: "α", capitalCharacter: "Α", name: "alpha".localizedLowercase)
        characterView.characterViewModel = character
        characterSelectionViewController.select(character: character)
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
        let heightConstraint = NSLayoutConstraint(item: characterSelectionViewController.view, attribute: .height, relatedBy: .equal, toItem: characterView, attribute: .height, multiplier: 0.35, constant: 0)
        heightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            heightConstraint,
            characterSelectionViewController.view.topAnchor.constraint(equalTo: characterView.bottomAnchor),
            characterSelectionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterSelectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterSelectionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}

