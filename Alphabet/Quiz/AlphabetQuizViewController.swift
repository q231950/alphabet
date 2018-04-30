//
//  QuizViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 22.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension AlphabetQuizViewController: CharacterSelectable {
    func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel) {
        let success = quiz.solveTask(solution: characterViewModel)
        let message = success ? " success 🙌": "out success 😛"
        print("solved with\(message)")
        
        topViewController?.characterViewModel = quiz.currentTask()
        bottomViewController?.clearSelection()
    }
}

class AlphabetQuizViewController: UIViewController, TopBottomViewControllerContaining {
    var topViewController: CharacterViewController? = CharacterViewController()
    var bottomViewController: CharacterSelectionViewController?
    fileprivate let quiz = Quiz(alphabet: .scientific)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alphabet Quiz"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        bottomViewController = CharacterSelectionViewController(alphabet: quiz.choices, characterSelectable: self)
        
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        topViewController?.characterViewModel = quiz.currentTask()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
