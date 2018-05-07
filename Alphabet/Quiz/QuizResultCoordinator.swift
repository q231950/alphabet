//
//  QuizResultCoordinator.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/6/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

class QuizResultCoordinator {

    public var totalAnswers: Int {
        get {
            return recordings.count
        }
    }

    public var correctAnswers: Int {
        get {
            return countRecordings(by: true)
        }
    }

    public var incorrectAnswers: Int {
        get {
            return countRecordings(by: false)
        }
    }

    private var recordings = [ResultType]()

    func record(_ result: ResultType) {
        recordings.append(result)
    }

    private func countRecordings(by success: Bool) -> Int {
        return recordings.filter({ (result) -> Bool in
            switch result {
            case .success(solution: _):
                return success
            case .mistake(solution: _):
                return !success
            }
        }).count
    }
}
