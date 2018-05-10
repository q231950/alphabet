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
        if let result = quiz?.solveTask(solution: characterViewModel) {
            resultCoordinator?.record(result)
            resultView.showResult(result)
        }

        if let next = quiz?.currentTask() {
            updateChildViewControllers(using: next)
        } else {
            showResults()
        }
    }
}

class AlphabetQuizViewController: UIViewController, TopBottomViewControllerContaining {
    var resultCoordinator: QuizResultCoordinator?
    var topViewController: CharacterViewController?
    var bottomViewController: QuizChoiceViewController?
    fileprivate var quiz: Quiz? {
        didSet {
            if let q = quiz, let task = q.currentTask() {
                updateChildViewControllers(using: task)
            }
        }
    }
    private let resultView = TaskSolutionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alphabet Quiz"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)

        topViewController = CharacterViewController()
        topViewController?.quizMode = true
        bottomViewController = QuizChoiceViewController(characterSelectable: self)
        setupViewControllers()
        
        setupTaskSolutionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        prepareNewQuiz()
    }

    private func updateChildViewControllers(using task: QuizTask) {
        topViewController?.characterViewModel = task.solution
        bottomViewController?.update(with: task)
    }

    private func showResults() {
        guard let resultCoordinator = resultCoordinator, let selectionViewController = bottomViewController else {
            return
        }

        selectionViewController.enabled = false

        let quizResultViewController = QuizResultViewController(resultCoordinator: resultCoordinator, completion: { [weak self] in
            self?.prepareNewQuiz()
        })
        present(quizResultViewController, animated: true) {
            print("done presenting quizResultViewController")
        }
    }

    private func prepareNewQuiz() {
        quiz = Quiz(alphabet: .scientific)
        resultCoordinator = QuizResultCoordinator()

        if let selectionViewController = bottomViewController {
            selectionViewController.enabled = true
        }
    }

    private func setupTaskSolutionView() {
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
