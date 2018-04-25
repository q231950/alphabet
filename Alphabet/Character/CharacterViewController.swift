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
            characterView.characterLabel.text = characterViewModel?.character
            characterView.capitalCharacterLabel.text = characterViewModel?.capitalCharacter
            characterView.characterDescriptionLabel.text = characterViewModel?.name
        }
    }

    override func loadView() {
        super.loadView()
        
        characterView = CharacterView()
        view = characterView
    }
}
