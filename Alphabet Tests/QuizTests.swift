//
//  QuizTests.swift
//  Alphabet Tests
//
//  Created by Martin Kim Dung-Pham on 5/5/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import XCTest
@testable import Alphabet

class QuizTests: XCTestCase {

    var quiz: Quiz!
    var solution: CharacterViewModel!
    var alphabet: AlphabetViewModel!

    override func setUp() {
        super.setUp()

        alphabet = AlphabetViewModel(characters: [CharacterViewModel(character: "a", capitalCharacter: "A", name: "Letter A"),
                                                  CharacterViewModel(character: "b", capitalCharacter: "B", name: "Letter B"),
                                                  CharacterViewModel(character: "c", capitalCharacter: "C", name: "Letter C"),
                                                  CharacterViewModel(character: "d", capitalCharacter: "D", name: "Letter D"),
                                                  ])
        quiz = Quiz(alphabet: alphabet)
        solution = CharacterViewModel()
    }

    func testQuizHasTask() {
        XCTAssertNotNil(quiz.currentTask())
    }

    func testSolvingAdvancesCurrentTask() {
        let currentTask = quiz.currentTask()
        _ = quiz.solveTask(solution: solution)
        let nextTask = quiz.currentTask()
        XCTAssertNotEqual(currentTask, nextTask)
    }

    func testIncorrectSolution() {
        let result = quiz.solveTask(solution: solution)
        XCTAssertFalse(result)
    }
}
