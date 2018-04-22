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
    let capitalCharacterLabel = UILabel()
    let characterDescriptionLabel = UILabel()
    let characterStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    var characterViewModel: CharacterViewModel? {
        didSet {
            characterLabel.text = characterViewModel?.character
            capitalCharacterLabel.text = characterViewModel?.capitalCharacter
            characterDescriptionLabel.text = characterViewModel?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCharacterLabels()
        setupCharacterDescriptionLabel()
        setupVerticalStackView(views: [characterStackView, characterDescriptionLabel])
        
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
        characterStackView.distribution = .fillEqually
        characterStackView.alignment = .center
        characterStackView.translatesAutoresizingMaskIntoConstraints = false
        characterStackView.isLayoutMarginsRelativeArrangement = true
        characterStackView.layoutMargins = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)

        setupLabel(characterLabel)
        characterStackView.addArrangedSubview(characterLabel)

        setupLabel(capitalCharacterLabel)
        characterStackView.addArrangedSubview(capitalCharacterLabel)
    }

    private func setupLabel(_ label: UILabel) {
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 80)
    }
    
    private func setupCharacterDescriptionLabel() {
        characterDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        characterDescriptionLabel.textAlignment = .center
        characterDescriptionLabel.font = UIFont(name: "Times New Roman", size: 40)
        characterDescriptionLabel.adjustsFontForContentSizeCategory = true
    }
}
