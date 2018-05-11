//
//  ResultType.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/6/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

enum ResultType: Equatable {
    case success(solution: CharacterViewModel)
    case mistake(solution: CharacterViewModel)
}

func ==(lhs: ResultType, rhs: ResultType) -> Bool {
    switch (lhs, rhs) {
    case (.success(let a), .success(let b)),
         (.mistake(let a), .mistake(let b)):
        return a == b
    default:
        return false
    }
}
