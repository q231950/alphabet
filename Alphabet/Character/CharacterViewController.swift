//
//  CharacterViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 25.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    var characterView: CharacterView!
    var characterViewModel: CharacterViewModel? {
        didSet {
            updateView(with: characterViewModel)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateView(with: characterViewModel)
    }

    override func loadView() {
        super.loadView()
        
        characterView = CharacterView()
        view = characterView
    }
    
    private func updateView(with characterViewModel: CharacterViewModel?) {
        guard let characterViewModel = characterViewModel else {
            return
        }
        
        characterView.update(character: characterViewModel.character,
                             capitalCharacter: characterViewModel.capitalCharacter,
                             description: characterViewModel.name)
    }
}
