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
        if let next = quiz.currentTask() {
            topViewController?.characterViewModel = next.solution
            bottomViewController?.update(with: next)
        } else {
            print("Finito")
        }
    }
}

class AlphabetQuizViewController: UIViewController, TopBottomViewControllerContaining {
    var topViewController: CharacterViewController? = CharacterViewController()
    var bottomViewController: QuizChoiceViewController?
    fileprivate let quiz = Quiz(alphabet: .scientific)
    private let resultView = TaskSolutionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alphabet Quiz"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        topViewController?.quizMode = true
        bottomViewController = QuizChoiceViewController(characterSelectable: self)
        
        setupViewControllers()
        
        setupTaskResultView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let task = quiz.currentTask() else {
            return
        }

        topViewController?.characterViewModel = task.solution
        bottomViewController?.update(with: task)
    }
    
    private func setupTaskResultView() {
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
