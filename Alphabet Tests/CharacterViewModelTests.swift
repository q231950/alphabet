//
//  CharacterViewModelTests.swift
//  Alphabet Tests
//
//  Created by Martin Kim Dung-Pham on 5/6/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import XCTest
@testable import Alphabet

class CharacterViewModelTests: XCTestCase {

    func testInitSetsValuesCorrectly() {
        let character = "character"
        let capitalCharacter = "CHARACTER"
        let name = "name"
        let viewModel = CharacterViewModel(character: character,
                                           capitalCharacter: capitalCharacter,
                                           name: name)
        XCTAssertEqual(viewModel.character, character)
        XCTAssertEqual(viewModel.capitalCharacter, capitalCharacter)
        XCTAssertEqual(viewModel.name, name)
    }
}
