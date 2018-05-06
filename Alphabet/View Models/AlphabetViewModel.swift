//
//  AlphabetViewModel.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

public struct AlphabetViewModel {
    let characters: [CharacterViewModel]
    
    init(characters: [CharacterViewModel] = []) {
        self.characters = characters
    }

    static let scientific = AlphabetViewModel(characters: [
        CharacterViewModel(character: "α", capitalCharacter:"Α", name: "alpha"),
        CharacterViewModel(character: "β", capitalCharacter:"Β", name: "beta"),
        CharacterViewModel(character: "γ", capitalCharacter:"Γ", name: "gamma"),
        CharacterViewModel(character: "δ", capitalCharacter:"Δ", name: "delta"),
        CharacterViewModel(character: "ε", capitalCharacter:"Ε", name: "epsilon"),
        CharacterViewModel(character: "ϝ", capitalCharacter:"Ϝ", name: "digamma"),
        CharacterViewModel(character: "ζ", capitalCharacter:"Ζ", name: "zeta"),
        CharacterViewModel(character: "η", capitalCharacter:"Η", name: "eta"),
        CharacterViewModel(character: "θ", capitalCharacter:"Θ", name: "theta"),
        CharacterViewModel(character: "ι", capitalCharacter:"Ι", name: "iota"),
        CharacterViewModel(character: "κ", capitalCharacter:"Κ", name: "kappa"),
        CharacterViewModel(character: "λ", capitalCharacter:"Λ", name: "lambda"),
        CharacterViewModel(character: "μ", capitalCharacter:"Μ", name: "mu"),
        CharacterViewModel(character: "ν", capitalCharacter:"Ν", name: "nu"),
        CharacterViewModel(character: "ξ", capitalCharacter:"Ξ", name: "xi"),
        CharacterViewModel(character: "ο", capitalCharacter:"Ο", name: "omicron"),
        CharacterViewModel(character: "π", capitalCharacter:"Π", name: "pi"),
        CharacterViewModel(character: "ρ", capitalCharacter:"Ρ", name: "rho"),
        CharacterViewModel(character: "σ/ς", capitalCharacter:"Σ", name: "sigma"),
        CharacterViewModel(character: "τ", capitalCharacter:"Τ", name: "tau"),
        CharacterViewModel(character: "υ", capitalCharacter:"Υ", name: "upsilon"),
        CharacterViewModel(character: "φ", capitalCharacter:"Φ", name: "phi"),
        CharacterViewModel(character: "χ", capitalCharacter:"Χ", name: "chi"),
        CharacterViewModel(character: "ψ", capitalCharacter:"Ψ", name: "psi"),
        CharacterViewModel(character: "ω", capitalCharacter:"Ω", name: "omega"),
        ])

    static let greek = AlphabetViewModel(characters: [
        CharacterViewModel(character: "α", capitalCharacter:"Α", name: "alpha"),
        CharacterViewModel(character: "β", capitalCharacter:"Β", name: "beta"),
        CharacterViewModel(character: "γ", capitalCharacter:"Γ", name: "gamma"),
        CharacterViewModel(character: "δ", capitalCharacter:"Δ", name: "delta"),
        CharacterViewModel(character: "ε", capitalCharacter:"Ε", name: "epsilon"),
        CharacterViewModel(character: "ζ", capitalCharacter:"Ζ", name: "zeta"),
        CharacterViewModel(character: "η", capitalCharacter:"Η", name: "eta"),
        CharacterViewModel(character: "θ", capitalCharacter:"Θ", name: "theta"),
        CharacterViewModel(character: "ι", capitalCharacter:"Ι", name: "iota"),
        CharacterViewModel(character: "κ", capitalCharacter:"Κ", name: "kappa"),
        CharacterViewModel(character: "λ", capitalCharacter:"Λ", name: "lambda"),
        CharacterViewModel(character: "μ", capitalCharacter:"Μ", name: "mu"),
        CharacterViewModel(character: "ν", capitalCharacter:"Ν", name: "nu"),
        CharacterViewModel(character: "ξ", capitalCharacter:"Ξ", name: "xi"),
        CharacterViewModel(character: "ο", capitalCharacter:"Ο", name: "omicron"),
        CharacterViewModel(character: "π", capitalCharacter:"Π", name: "pi"),
        CharacterViewModel(character: "ρ", capitalCharacter:"Ρ", name: "rho"),
        CharacterViewModel(character: "σ/ς", capitalCharacter:"Σ", name: "sigma"),
        CharacterViewModel(character: "τ", capitalCharacter:"Τ", name: "tau"),
        CharacterViewModel(character: "υ", capitalCharacter:"Υ", name: "upsilon"),
        CharacterViewModel(character: "φ", capitalCharacter:"Φ", name: "phi"),
        CharacterViewModel(character: "χ", capitalCharacter:"Χ", name: "chi"),
        CharacterViewModel(character: "ψ", capitalCharacter:"Ψ", name: "psi"),
        CharacterViewModel(character: "ω", capitalCharacter:"Ω", name: "omega"),
        ])
}
