//
//  CharacterSelectionViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class CharacterSelectionViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    init(alphabet: AlphabetViewModel = AlphabetViewModel(), characterSelectable: CharacterSelectable) {
        super.init(nibName: nil, bundle: nil)
        
        setupScrollView()
        setupStackView()
        layout(alphabet, characterSelectable: characterSelectable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func layout(_ alphabet: AlphabetViewModel, characterSelectable: CharacterSelectable) {
        alphabet.characters.forEach { (character) in
            let characterSelectionView = CharacterSelectionView(character: character, characterSelectable: characterSelectable)
            stackView.addArrangedSubview(characterSelectionView)
        }
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        let stackViewMargin: CGFloat = 10
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: stackViewMargin),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: stackViewMargin),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -stackViewMargin),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -stackViewMargin),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            ])
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = .darkGray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = true
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
}
