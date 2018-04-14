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
    
    init(alphabet: AlphabetViewModel = AlphabetViewModel(), characterSelectable: CharacterSelectable) {
        super.init(nibName: nil, bundle: nil)
        
        setupScrollView()
        layout(alphabet, characterSelectable: characterSelectable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func layout(_ alphabet: AlphabetViewModel, characterSelectable: CharacterSelectable) {
        var previousView: UIView? = nil
        let margin: CGFloat = 5
        
        alphabet.characters.forEach { (character) in
            let characterSelectionView = CharacterSelectionView(character: character,
                                                                characterSelectable: characterSelectable)
            characterSelectionView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(characterSelectionView)
            NSLayoutConstraint.activate([
                characterSelectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                characterSelectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                ])
            
            if let previousView = previousView {
                characterSelectionView.leftAnchor.constraint(equalTo: previousView.rightAnchor, constant: margin).isActive = true
            } else {
                characterSelectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: margin).isActive = true
            }
            
            if let last = alphabet.characters.last, last == character {
                characterSelectionView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -margin).isActive = true
            }
            
            previousView = characterSelectionView
        }
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
