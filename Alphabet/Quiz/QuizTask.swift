//
//  QuizTask.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/3/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

struct QuizTask: Equatable, Hashable {
    let solution: CharacterViewModel
    let choices: [CharacterViewModel]

    var hashValue: Int {
        return solution.character.hashValue
    }
}
