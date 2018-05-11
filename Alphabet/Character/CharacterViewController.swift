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
    var quizMode: Bool = false {
        didSet {
            characterView.isCharacterDescriptionLabelHidden = quizMode
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        characterView = CharacterView()
        view = characterView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateView(with: characterViewModel)
    }

    private func updateView(with characterViewModel: CharacterViewModel?) {
        guard let characterViewModel = characterViewModel else {
            return
        }
        
        characterView.update(character: characterViewModel.character,
                             variant: characterViewModel.variant,
                             capitalCharacter: characterViewModel.capitalCharacter,
                             description: characterViewModel.name)
    }
}
