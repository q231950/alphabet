//
//  QuizResultViewModel.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/6/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class QuizResultViewModel {

    let resultCoordinator: QuizResultCoordinator
    let traitCollection: UITraitCollection

    init(resultCoordinator: QuizResultCoordinator, traitCollection: UITraitCollection) {
        self.resultCoordinator = resultCoordinator
        self.traitCollection = traitCollection
    }

    private var verhaeltnis: Float {
        get {
            return Float(resultCoordinator.correctAnswers) / Float(resultCoordinator.totalAnswers)
        }
    }

    var emoji: NSAttributedString {
        get {
            return NSAttributedString(string: face(for: verhaeltnis),
                                      style: .largeCharacterStyle,
                                      traitCollection: traitCollection)
        }
    }

    private func face(for value: Float) -> String {
        if verhaeltnis == 1 {
            return "💯"
        } else if verhaeltnis > 0.9 {
            return "🤪"
        } else if verhaeltnis > 0.8 {
            return "😝"
        } else if verhaeltnis > 0.7 {
            return "😊"
        } else if verhaeltnis > 0.6 {
            return "😲"
        } else if verhaeltnis > 0.4 {
            return "😐"
        } else if verhaeltnis > 0.3 {
            return "😕"
        } else if verhaeltnis > 0.2 {
            return "🙁"
        } else if verhaeltnis > 0.1 {
            return "😣"
        } else {
            return "😶"
        }
    }

    var title: NSAttributedString {
        get {
            return NSAttributedString(string: title(for: verhaeltnis),
                                      style: .largeCharacterStyle,
                                      traitCollection: traitCollection)
        }
    }

    private func title(for value: Float) -> String {
        if verhaeltnis > 0.9 {
            return "Awesome"
        } else if verhaeltnis > 0.8 {
            return "Great"
        } else if verhaeltnis > 0.7 {
            return "Good job"
        } else if verhaeltnis > 0.6 {
            return "Getting there"
        } else if verhaeltnis > 0.4 {
            return "Medium"
        } else if verhaeltnis > 0.3 {
            return "Could be..."
        } else if verhaeltnis > 0.2 {
            return "Repeat"
        } else if verhaeltnis > 0.1 {
            return "Not yet okay"
        } else {
            return "Well..."
        }
    }

    var result: NSAttributedString {
        get {
            return NSAttributedString(string: result(for: verhaeltnis),
                style: .largeTextStyle,
                traitCollection: traitCollection)
        }
    }

    private func result(for value: Float) -> String {
        if verhaeltnis > 0.9 {
            return "Are you scientist or are you Greek? 🥇 \(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved, congratulations!"
        } else if verhaeltnis > 0.8 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved, congratulations 🥈"
        } else if verhaeltnis > 0.7 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved, congratulations 🥉"
        } else if verhaeltnis > 0.6 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved"
        } else if verhaeltnis > 0.5 {
            return "\(resultCoordinator.correctAnswers) are more than \(resultCoordinator.incorrectAnswers) - you are getting there. You correctly solved \(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers)."
        } else if verhaeltnis > 0.4 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved"
        } else if verhaeltnis > 0.3 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved"
        } else if verhaeltnis > 0.2 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved"
        } else if verhaeltnis > 0.1 {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved"
        } else {
            return "\(resultCoordinator.correctAnswers) out of \(resultCoordinator.totalAnswers) questions were correctly solved"
        }
    }
}
