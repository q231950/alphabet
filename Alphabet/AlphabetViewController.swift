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
        bottomViewController?.select(character: characterViewModel)
        topViewController?.characterViewModel = characterViewModel
        view.layoutIfNeeded()
    }
}

class AlphabetViewController: UIViewController, TopBottomViewControllerContaining, CharacterSelectable {
    var topViewController: CharacterViewController? = CharacterViewController()
    var bottomViewController: CharacterSelectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scientific Greek Alphabet"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        bottomViewController = CharacterSelectionViewController(alphabet: .scientific, characterSelectable: self)
        
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let character = CharacterViewModel(character: "α", capitalCharacter: "Α", name: "alpha".localizedLowercase)
        topViewController?.characterViewModel = character
        bottomViewController?.select(character: character)
    }
}
