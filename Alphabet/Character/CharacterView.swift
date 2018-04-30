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
    
    private let characterLabel = UILabel()
    private let capitalCharacterLabel = UILabel()
    let characterDescriptionLabel = UILabel()
    var isCharacterDescriptionLabelHidden: Bool = false {
        didSet {
            characterDescriptionLabel.isHidden = isCharacterDescriptionLabelHidden
        }
    }
    let characterStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCharacterLabels()
        setupCharacterDescriptionLabel()
        setupVerticalStackView(views: [characterStackView, characterDescriptionLabel])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(character: String, capitalCharacter: String, description: String) {
        characterLabel.attributedText = NSAttributedString(string: character,
                                                           style: .largeCharacterStyle, traitCollection: traitCollection)
        capitalCharacterLabel.attributedText = NSAttributedString(string: capitalCharacter,
                                                                  style: .largeCharacterStyle, traitCollection: traitCollection)
        characterDescriptionLabel.attributedText = NSAttributedString(string: description,
                                                                  style: .largeTextStyle, traitCollection: traitCollection)
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
