//
//  TaskTests.swift
//  Alphabet Tests
//
//  Created by Martin Kim Dung-Pham on 5/5/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import XCTest
@testable import Alphabet

class TaskTests: XCTestCase {

    var choices = [
        CharacterViewModel(character: "a", capitalCharacter: "A", name: "Letter A"),
        CharacterViewModel(character: "b", capitalCharacter: "B", name: "Letter B"),
        CharacterViewModel(character: "c", capitalCharacter: "C", name: "Letter C"),
        CharacterViewModel(character: "d", capitalCharacter: "D", name: "Letter D"),
        ]

    func testNumberOfChoices() {
        let solution = CharacterViewModel(character: "a", capitalCharacter: "A", name: "Letter A")
        let task = QuizTask(solution: solution, choices: choices)
        XCTAssertEqual(task.choices.count, 4)
    }
}
