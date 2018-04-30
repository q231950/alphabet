//
//  CharacterSelectionViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class CharacterSelectionViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private var characterSelectionViews = [CharacterSelectionView]()
    private let stackViewEdgeSpacing: CGFloat = 20
    private let stackViewSpacing: CGFloat = 30
    private let characterSelectable: CharacterSelectable?
    private let alphabet: AlphabetViewModel
    
    init(alphabet: AlphabetViewModel = AlphabetViewModel(), characterSelectable: CharacterSelectable) {
        self.characterSelectable = characterSelectable
        self.alphabet = alphabet

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 0.4, alpha: 1)

        setupScrollView()
        setupStackView()
        layoutAlphabet(alphabet, characterSelectable: characterSelectable)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        scrollView.flashScrollIndicators()
    }

    required init?(coder aDecoder: NSCoder) {
        self.characterSelectable = nil
        self.alphabet = AlphabetViewModel()
        super.init(coder: aDecoder)
    }
    
    func select(character: CharacterViewModel?) {
        characterSelectionViews.forEach { characterView in
            characterView.selected = characterView.character == character
        }
    }
    
    func clearSelection() {
        select(character: nil)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        characterSelectionViews.forEach { selectionView in
            selectionView.layoutAxis = UITraitCollection.axis(for: traitCollection)
        }
    }
    
    private func layoutAlphabet(_ alphabet: AlphabetViewModel, characterSelectable: CharacterSelectable?) {
        alphabet.characters.forEach { (character) in
            let characterSelectionView = CharacterSelectionView(character: character, characterSelectable: characterSelectable)
            characterSelectionViews.append(characterSelectionView)
            stackView.addArrangedSubview(characterSelectionView)
        }
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .bottom
        stackView.spacing = stackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: stackViewEdgeSpacing, left: stackViewEdgeSpacing, bottom: stackViewEdgeSpacing, right: stackViewEdgeSpacing)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.bottomAnchor),
            ])
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.indicatorStyle = .white
        scrollView.clipsToBounds = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])
    }
}
