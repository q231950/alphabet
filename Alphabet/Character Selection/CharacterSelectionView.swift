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
    let button: UIButton = UIButton(type: UIButtonType.roundedRect)
    let buttonInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    let borderView = UIView()
    public var selected: Bool {
        didSet {
            borderView.isHidden = !selected
        }
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            let contentSize = button.intrinsicContentSize
            return CGSize(width: buttonInsets.left + contentSize.width + buttonInsets.right,
                          height: contentSize.height)
        }
    }
    
    init(character: CharacterViewModel, characterSelectable: CharacterSelectable?) {
        self.character = character
        self.characterSelectable = characterSelectable
        self.selected = false
        
        super.init(frame: .zero)
        setupSelectionBorder()
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        character = CharacterViewModel()
        self.selected = false
        super.init(coder: aDecoder)
    }
    
    private func setupSelectionBorder() {
        addSubview(borderView)
        borderView.isHidden = true
        borderView.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setupButton() {
        button.setTitle(character.name, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didPressButton), for:.touchUpInside)
        button.titleEdgeInsets = buttonInsets
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leftAnchor.constraint(equalTo: leftAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor),
            ])
    }
}

