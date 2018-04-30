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
    let alphabetButton = UIButton(type: .roundedRect)
    let quizButton = UIButton(type: .roundedRect)
    let buttonContentEdgeInsets = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "α β γ"
        
        setupAlphabetButton()
        setupQuizButton()
        setupStackView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        stackView.axis = traitCollection.verticalSizeClass == .regular ? .vertical : .horizontal
        
        updateButtonTitleAttributes()
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])
        stackView.addArrangedSubview(alphabetButton)
        stackView.addArrangedSubview(quizButton)
    }
    
    private func setupAlphabetButton() {
        updateButtonTitle(button: alphabetButton, title: "Scientific Greek Alphabet")
        alphabetButton.addTarget(self, action: #selector(ViewController.didTapAlphabetButton), for: .touchUpInside)
        alphabetButton.layer.backgroundColor = UIColor(white: 0.9, alpha: 1).cgColor
        alphabetButton.layer.cornerRadius = 5
        alphabetButton.contentEdgeInsets = buttonContentEdgeInsets
    }
    
    @objc func didTapAlphabetButton() {
        let alphabetViewController = AlphabetViewController()
        navigationController?.pushViewController(alphabetViewController, animated: true)
    }
    
    private func setupQuizButton() {
        updateButtonTitle(button: quizButton, title: "Alphabet Quiz")
        quizButton.addTarget(self, action: #selector(ViewController.didTapQuizButton), for: .touchUpInside)
        quizButton.layer.backgroundColor = UIColor(white: 0.9, alpha: 1).cgColor
        quizButton.layer.cornerRadius = 5
        quizButton.contentEdgeInsets = buttonContentEdgeInsets
    }
    
    private func updateButtonTitle(button: UIButton, title: String?) {
        guard let title = title else {
            return
        }
        
        let attributedTitle = NSAttributedString(string: title, style: .largeButtonStyle, traitCollection: traitCollection)
        button.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    private func updateButtonTitleAttributes() {
        [alphabetButton, quizButton].forEach { (button) in
            updateButtonTitle(button: button, title: button.attributedTitle(for: .normal)?.string)
        }
    }
    
    @objc func didTapQuizButton() {
        let quizViewController = AlphabetQuizViewController()
        navigationController?.pushViewController(quizViewController, animated: true)
    }
}
