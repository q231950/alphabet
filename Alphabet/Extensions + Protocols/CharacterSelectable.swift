//
//  CharacterSelectable.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 25.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

protocol CharacterViewContaining where Self: UIViewController {
    func setupCharacterView(_ characterView: UIView)
}

extension CharacterViewContaining {
    func setupCharacterView(_ characterView: UIView) {
        view.addSubview(characterView)
        characterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.topAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}
