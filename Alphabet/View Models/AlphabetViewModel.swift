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
        CharacterViewModel(character: "α", variant: nil, capitalCharacter:"Α", name: "alpha"),
        CharacterViewModel(character: "β", variant: nil, capitalCharacter:"Β", name: "beta"),
        CharacterViewModel(character: "γ", variant: nil, capitalCharacter:"Γ", name: "gamma"),
        CharacterViewModel(character: "δ", variant: nil, capitalCharacter:"Δ", name: "delta"),
        CharacterViewModel(character: "ε", variant: "ϵ", capitalCharacter:"Ε", name: "epsilon"),
        CharacterViewModel(character: "ϝ", variant: nil, capitalCharacter:"Ϝ", name: "digamma"),
        CharacterViewModel(character: "ζ", variant: nil, capitalCharacter:"Ζ", name: "zeta"),
        CharacterViewModel(character: "η", variant: nil, capitalCharacter:"Η", name: "eta"),
        CharacterViewModel(character: "θ", variant: nil, capitalCharacter:"Θ", name: "theta"),
        CharacterViewModel(character: "ι", variant: nil, capitalCharacter:"Ι", name: "iota"),
        CharacterViewModel(character: "κ", variant: "ϰ", capitalCharacter:"Κ", name: "kappa"),
        CharacterViewModel(character: "λ", variant: nil, capitalCharacter:"Λ", name: "lambda"),
        CharacterViewModel(character: "μ", variant: nil, capitalCharacter:"Μ", name: "mu"),
        CharacterViewModel(character: "ν", variant: nil, capitalCharacter:"Ν", name: "nu"),
        CharacterViewModel(character: "ξ", variant: nil, capitalCharacter:"Ξ", name: "xi"),
        CharacterViewModel(character: "ο", variant: nil, capitalCharacter:"Ο", name: "omicron"),
        CharacterViewModel(character: "π", variant: "ϖ", capitalCharacter:"Π", name: "pi"),
        CharacterViewModel(character: "ρ", variant: "ϱ", capitalCharacter:"Ρ", name: "rho"),
        CharacterViewModel(character: "σ", variant: "ς", capitalCharacter:"Σ", name: "sigma"),
        CharacterViewModel(character: "τ", variant: nil, capitalCharacter:"Τ", name: "tau"),
        CharacterViewModel(character: "υ", variant: nil, capitalCharacter:"Υ", name: "upsilon"),
        CharacterViewModel(character: "ϕ", variant: "φ", capitalCharacter:"Φ", name: "phi"),
        CharacterViewModel(character: "χ", variant: nil, capitalCharacter:"Χ", name: "chi"),
        CharacterViewModel(character: "ψ", variant: nil, capitalCharacter:"Ψ", name: "psi"),
        CharacterViewModel(character: "ω", variant: nil, capitalCharacter:"Ω", name: "omega"),
        ])

    static let greek = AlphabetViewModel(characters: [
        CharacterViewModel(character: "α", variant: nil, capitalCharacter:"Α", name: "alpha"),
        CharacterViewModel(character: "β", variant: nil, capitalCharacter:"Β", name: "beta"),
        CharacterViewModel(character: "γ", variant: nil, capitalCharacter:"Γ", name: "gamma"),
        CharacterViewModel(character: "δ", variant: nil, capitalCharacter:"Δ", name: "delta"),
        CharacterViewModel(character: "ε", variant: nil, capitalCharacter:"Ε", name: "epsilon"),
        CharacterViewModel(character: "ζ", variant: nil, capitalCharacter:"Ζ", name: "zeta"),
        CharacterViewModel(character: "η", variant: nil, capitalCharacter:"Η", name: "eta"),
        CharacterViewModel(character: "θ", variant: nil, capitalCharacter:"Θ", name: "theta"),
        CharacterViewModel(character: "ι", variant: nil, capitalCharacter:"Ι", name: "iota"),
        CharacterViewModel(character: "κ", variant: nil, capitalCharacter:"Κ", name: "kappa"),
        CharacterViewModel(character: "λ", variant: nil, capitalCharacter:"Λ", name: "lambda"),
        CharacterViewModel(character: "μ", variant: nil, capitalCharacter:"Μ", name: "mu"),
        CharacterViewModel(character: "ν", variant: nil, capitalCharacter:"Ν", name: "nu"),
        CharacterViewModel(character: "ξ", variant: nil, capitalCharacter:"Ξ", name: "xi"),
        CharacterViewModel(character: "ο", variant: nil, capitalCharacter:"Ο", name: "omicron"),
        CharacterViewModel(character: "π", variant: nil, capitalCharacter:"Π", name: "pi"),
        CharacterViewModel(character: "ρ", variant: nil, capitalCharacter:"Ρ", name: "rho"),
        CharacterViewModel(character: "σ/ς", variant: nil, capitalCharacter:"Σ", name: "sigma"),
        CharacterViewModel(character: "τ", variant: nil, capitalCharacter:"Τ", name: "tau"),
        CharacterViewModel(character: "υ", variant: nil, capitalCharacter:"Υ", name: "upsilon"),
        CharacterViewModel(character: "φ", variant: nil, capitalCharacter:"Φ", name: "phi"),
        CharacterViewModel(character: "χ", variant: nil, capitalCharacter:"Χ", name: "chi"),
        CharacterViewModel(character: "ψ", variant: nil, capitalCharacter:"Ψ", name: "psi"),
        CharacterViewModel(character: "ω", variant: nil, capitalCharacter:"Ω", name: "omega"),
        ])
}
