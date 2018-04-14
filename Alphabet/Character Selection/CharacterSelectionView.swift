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
    let button: UIButton = UIButton(type: .custom)
    
    init(character: CharacterViewModel, characterSelectable: CharacterSelectable?) {
        self.character = character
        self.characterSelectable = characterSelectable
        
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        character = CharacterViewModel.emptyCharacter
        super.init(coder: aDecoder)
    }
    
    @objc func didPressButton() {
        characterSelectable?.didSelectCharacterViewModel(character)
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            return button.intrinsicContentSize
        }
    }
    
    private func setupButton() {
        button.setTitle(character.name, for: .normal)
        button.addTarget(self, action: #selector(didPressButton), for:.touchUpInside)
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
