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
    
    let characterLabel = UILabel()
    let characterNameLabel = UILabel()
    let characterStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    var characterViewModel: CharacterViewModel? {
        didSet {
            characterLabel.text = characterViewModel?.character
            characterNameLabel.text = characterViewModel?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCharacterLabels()
        setupCharacterNameLabel()
        setupVerticalStackView(views: [characterStackView, characterNameLabel])
        
        backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupVerticalStackView(views: [UIView]) {
        addSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            verticalStackView.leftAnchor.constraint(equalTo: leftAnchor),
            verticalStackView.rightAnchor.constraint(equalTo: rightAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            ])
        addSubview(verticalStackView)
        views.forEach { (view) in
            verticalStackView.addArrangedSubview(view)
        }
    }
    
    private func setupCharacterLabels() {
        characterStackView.axis = .horizontal
        characterStackView.backgroundColor = .orange
        characterStackView.translatesAutoresizingMaskIntoConstraints = false
        characterStackView.addArrangedSubview(characterLabel)

        characterLabel.textAlignment = .center
        characterLabel.font = UIFont(name: "Times New Roman", size: 80)
        characterLabel.adjustsFontSizeToFitWidth = true
        characterLabel.numberOfLines = 0
        characterLabel.lineBreakMode = .byClipping
    }
    
    private func setupCharacterNameLabel() {
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.textAlignment = .center
        characterNameLabel.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: UITraitCollection.init(horizontalSizeClass: .compact))
        characterNameLabel.font = UIFont.preferredFont(forTextStyle: .title2, compatibleWith: UITraitCollection.init(horizontalSizeClass: .regular))
        characterNameLabel.adjustsFontForContentSizeCategory = true
    }
}
