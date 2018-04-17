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

    //αβγδεζηθικλμνξοπρςστυφχψω
    static var greek: AlphabetViewModel = AlphabetViewModel(characters: [CharacterViewModel(character: "α", name: "alpha"),
                                                                         CharacterViewModel(character: "β", name: "beta"),
                                                                         CharacterViewModel(character: "γ", name: "gamma"),
                                                                         CharacterViewModel(character: "δ", name: "delta"),
                                                                         CharacterViewModel(character: "ε", name: "epsilon"),
                                                                         CharacterViewModel(character: "ζ", name: "zeta"),
                                                                         CharacterViewModel(character: "η", name: "eta"),
                                                                         CharacterViewModel(character: "θ", name: "theta"),
                                                                         CharacterViewModel(character: "ι", name: "iota"),
                                                                         CharacterViewModel(character: "κ", name: "kappa"),
                                                                         CharacterViewModel(character: "λ", name: "lambda"),
                                                                         CharacterViewModel(character: "μ", name: "mu"),
                                                                         CharacterViewModel(character: "ν", name: "nu"),
                                                                         CharacterViewModel(character: "ξ", name: "xi"),
                                                                         CharacterViewModel(character: "ο", name: "omicron"),
                                                                         CharacterViewModel(character: "π", name: "pi"),
                                                                         CharacterViewModel(character: "ρ", name: "rho"),
                                                                         CharacterViewModel(character: "σ/ς", name: "sigma"),
                                                                         CharacterViewModel(character: "τ", name: "tau"),
                                                                         CharacterViewModel(character: "υ", name: "upsilon"),
                                                                         CharacterViewModel(character: "φ", name: "phi"),
                                                                         CharacterViewModel(character: "χ", name: "chi"),
                                                                         CharacterViewModel(character: "ψ", name: "psi"),
                                                                         CharacterViewModel(character: "ω", name: "omega"),
                                                                         ])
}
