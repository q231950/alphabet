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
    let name: String
    
    static var emptyCharacter = CharacterViewModel(character: "", name: "")
    
    
}
