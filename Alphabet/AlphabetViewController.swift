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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scientific Greek Alphabet"
        
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
        NSLayoutConstraint.activate([
            characterSelectionViewController.view.topAnchor.constraint(equalTo: characterView.bottomAnchor),
            characterSelectionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterSelectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterSelectionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}

