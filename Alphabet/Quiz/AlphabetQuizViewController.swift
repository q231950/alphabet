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
        resultView.showResult(success: success)
        let message = success ? " success 🙌": "out success 😛"
        print("solved with\(message)")
        
        if let next = quiz.currentTask() {
            topViewController?.characterViewModel = next
        } else {
            print("Finito")
        }
        
        bottomViewController?.clearSelection()
    }
}

class AlphabetQuizViewController: UIViewController, TopBottomViewControllerContaining {
    var topViewController: CharacterViewController? = CharacterViewController()
    var bottomViewController: CharacterSelectionViewController?
    fileprivate let quiz = Quiz(alphabet: .scientific)
    private let resultView = ResultView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alphabet Quiz"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        topViewController?.quizMode = true
        bottomViewController = CharacterSelectionViewController(alphabet: quiz.choices, characterSelectable: self)
        
        setupViewControllers()
        
        setupResultView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        topViewController?.characterViewModel = quiz.currentTask()
    }
    
    private func setupResultView() {
        view.addSubview(resultView)
        resultView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
}
