//
//  AlphabetViewModel.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

struct AlphabetViewModel {
    let characters: [CharacterViewModel]
    
    init(characters: [CharacterViewModel] = []) {
        self.characters = characters
    }
}
