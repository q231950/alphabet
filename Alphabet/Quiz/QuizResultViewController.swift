//
//  QuizResultViewController.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/6/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class QuizResultViewController: UIViewController {

    let resultCoordinator: QuizResultCoordinator
    var completion: (() -> ())?

    required init(resultCoordinator: QuizResultCoordinator, completion: (() -> ())?) {
        self.completion = completion
        self.resultCoordinator = resultCoordinator

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        let resultViewModel = QuizResultViewModel(resultCoordinator: resultCoordinator,
                                                  traitCollection: traitCollection)
        let resultView = QuizResultView(resultViewModel: resultViewModel)
        resultView.closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        view = resultView
    }

    @objc func didTapCloseButton() {
        dismiss(animated: true) {
            print("done dismissing quiz result view")
        }
    }
}

