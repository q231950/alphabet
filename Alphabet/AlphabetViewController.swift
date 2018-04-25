//
//  AlphabetViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 22.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension AlphabetViewController {
    func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel) {
        characterSelectionViewController.select(character: characterViewModel)
        characterView.characterViewModel = characterViewModel
        view.layoutIfNeeded()
    }
}

class AlphabetViewController: UIViewController, CharacterViewContaining, CharacterSelectable {
    
    fileprivate let characterView = CharacterView()
    fileprivate var characterSelectionViewController: CharacterSelectionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scientific Greek Alphabet"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        characterSelectionViewController = CharacterSelectionViewController(alphabet: .scientific, characterSelectable: self)
        
        setupCharacterView(characterView)
        setupCharacterSelectionViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let character = CharacterViewModel(character: "α", capitalCharacter: "Α", name: "alpha".localizedLowercase)
        characterView.characterViewModel = character
        characterSelectionViewController.select(character: character)
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

