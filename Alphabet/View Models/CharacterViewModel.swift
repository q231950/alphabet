//
//  CharacterViewModel.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

struct CharacterViewModel: Equatable {
    let character: String
    var variant: String?
    let capitalCharacter: String
    let name: String

    init(character: String = "", variant: String? = nil, capitalCharacter: String = "", name: String = "") {
        self.character = character
        self.variant = variant
        self.capitalCharacter = capitalCharacter
        self.name = name
    }
}
