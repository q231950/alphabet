//
//  CharacterView.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

@IBDesignable
class CharacterView: UIView {
    
    var characterLabel = UILabel()
    var characterNameLabel = UILabel()
    
    var characterViewModel: CharacterViewModel? {
        didSet {
            characterLabel.text = characterViewModel?.character
            characterNameLabel.text = characterViewModel?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCharacterLabel()
        setupCharacterNameLabel()
        
        backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCharacterLabel() {
        addSubview(characterLabel)
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.textAlignment = .center
        characterLabel.font = UIFont.systemFont(ofSize: 80)
        characterLabel.adjustsFontSizeToFitWidth = true
        characterLabel.numberOfLines = 0
        characterLabel.lineBreakMode = .byClipping
        characterLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            characterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterLabel.leftAnchor.constraint(equalTo: leftAnchor),
            characterLabel.rightAnchor.constraint(equalTo: rightAnchor),
            ])
    }
    
    private func setupCharacterNameLabel() {
        addSubview(characterNameLabel)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.textAlignment = .center
        characterNameLabel.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: UITraitCollection.init(horizontalSizeClass: .compact))
        characterNameLabel.font = UIFont.preferredFont(forTextStyle: .title2, compatibleWith: UITraitCollection.init(horizontalSizeClass: .regular))
        characterNameLabel.adjustsFontForContentSizeCategory = true
        characterNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: characterLabel.bottomAnchor),
            characterNameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            characterNameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
}
