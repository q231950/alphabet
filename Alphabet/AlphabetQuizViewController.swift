//
//  QuizViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 22.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class AlphabetQuizViewController: UIViewController, TopBottomViewControllerContaining {
    var topViewController: CharacterViewController? = CharacterViewController()
    var bottomViewController: UIViewController? = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alphabet Quiz"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let character = CharacterViewModel(character: "α", capitalCharacter: "Α", name: "alpha".localizedLowercase)
        topViewController?.characterViewModel = character
    }
}
