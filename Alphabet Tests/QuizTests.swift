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
        quiz = Quiz(alphabet: alphabet, taskCount: 4)
        solution = CharacterViewModel()
    }

    func testQuizHasTask() {
        XCTAssertNotNil(quiz.currentTask())
    }

    func testNumberOfTasks() {
        XCTAssertEqual(quiz.tasks.count, 4)
    }

    func testTaskUniqueness() {
        var tasks = [QuizTask: Int]()
        for task in quiz.tasks {
            tasks[task] = (tasks[task] ?? 0) + 1
        }

        let nonUniqueTasks = tasks.filter { (task, occurrences) -> Bool in
            occurrences != 1
        }
        XCTAssertEqual(nonUniqueTasks.count, 0, "Each task must be unique.")
    }

    func testQuizFinishes() {
        for _ in 0...3 {
            _ = quiz.solveTask(solution: solution)
        }

        let offByOneTask = quiz.currentTask()
        XCTAssertNil(offByOneTask)
    }

    func testSolvingAdvancesCurrentTask() {
        let currentTask = quiz.currentTask()
        _ = quiz.solveTask(solution: solution)
        let nextTask = quiz.currentTask()
        XCTAssertNotEqual(currentTask, nextTask)
    }

    func testIncorrectSolution() {
        let result: ResultType = quiz.solveTask(solution: solution)
        XCTAssertEqual(result, ResultType.mistake(solution: solution))
    }
}
