//
//  CharacterSelectionView.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

protocol CharacterSelectable {
    func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel)
}

class CharacterSelectionView: UIView {
    let character: CharacterViewModel
    var characterSelectable: CharacterSelectable?
    let characterLabel = UILabel()
    let characterDescriptionLabel = UILabel()
    let stackView = UIStackView()
    let button: UIButton = UIButton(type: UIButtonType.roundedRect)
    let borderView = UIView()
    public var selected: Bool {
        didSet {
            borderView.isHidden = !selected
        }
    }
    
    public var layoutAxis: UILayoutConstraintAxis? {
        didSet {
            if let layoutAxis = layoutAxis {
                stackView.axis = layoutAxis
            }
        }
    }
    
    init(character: CharacterViewModel, characterSelectable: CharacterSelectable?) {
        self.character = character
        self.characterSelectable = characterSelectable
        self.selected = false
        
        super.init(frame: .zero)
        setupStackView()
        setupSelectionBorder()
        setupButton()
        setupCharacterLabel()
        setupCharacterDescriptionLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        character = CharacterViewModel()
        self.selected = false
        super.init(coder: aDecoder)
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            ])
        stackView.addArrangedSubview(characterLabel)
        stackView.addArrangedSubview(characterDescriptionLabel)
    }
    
    private func setupSelectionBorder() {
        addSubview(borderView)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.isHidden = true
        borderView.layer.borderColor = UIColor(white: 1, alpha: 0.5).cgColor
        borderView.layer.backgroundColor = UIColor(white: 0, alpha: 0.1).cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 3
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            borderView.leftAnchor.constraint(equalTo: leftAnchor),
            borderView.rightAnchor.constraint(equalTo: rightAnchor),
            ])
    }
    
    @objc func didPressButton() {
        characterSelectable?.didSelectCharacterViewModel(character)
        selected = true
    }
    
    private func setupCharacterLabel() {
        let small = String(describing: character.character)
        let capital = String(describing: character.capitalCharacter)
        characterLabel.text = "\(small)/\(capital)"
        characterLabel.font = UIFont(name: "Times New Roman", size: 20)
        characterLabel.textColor = .white
    }
    
    private func setupCharacterDescriptionLabel() {
        characterDescriptionLabel.text = "\(character.character)/\(character.capitalCharacter)"
        characterDescriptionLabel.font = UIFont(name: "Times New Roman", size: 20)
        characterDescriptionLabel.textColor = .white
        characterDescriptionLabel.text = character.name
    }
    
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didPressButton), for:.touchUpInside)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
}

