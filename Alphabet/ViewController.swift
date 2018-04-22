//
//  ViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    private let buttonAttributes: [NSAttributedStringKey:Any] = [.font:UIFont(name: "Times New Roman", size: 30)!, .foregroundColor: UIColor.black]
    let alphabetButton = UIButton(type: .roundedRect)
    let quizButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAlphabetButton()
        setupQuizButton()
        setupStackView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        stackView.axis = traitCollection.horizontalSizeClass == .compact ? .vertical : .horizontal
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])
        stackView.addArrangedSubview(alphabetButton)
        stackView.addArrangedSubview(quizButton)
    }
    
    private func setupAlphabetButton() {
        let title = NSAttributedString(string: "Scientific Greek Alphabet", attributes: buttonAttributes)
        alphabetButton.setAttributedTitle(title, for: .normal)
        alphabetButton.addTarget(self, action: #selector(ViewController.didTapAlphabetButton), for: .touchUpInside)
    }
    
    @objc func didTapAlphabetButton() {
        let alphabetViewController = AlphabetViewController()
        navigationController?.pushViewController(alphabetViewController, animated: true)
    }
    
    private func setupQuizButton() {
        let title = NSAttributedString(string: "Alphabet Quiz", attributes: buttonAttributes)
        quizButton.setAttributedTitle(title, for: .normal)
    }
    
}
