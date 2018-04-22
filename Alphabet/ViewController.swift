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
        updateButtonTitle(button: alphabetButton, title: "Scientific Greek Alphabet")
        alphabetButton.addTarget(self, action: #selector(ViewController.didTapAlphabetButton), for: .touchUpInside)
    }
    
    @objc func didTapAlphabetButton() {
        let alphabetViewController = AlphabetViewController()
        navigationController?.pushViewController(alphabetViewController, animated: true)
    }
    
    private func setupQuizButton() {
        updateButtonTitle(button: quizButton, title: "Alphabet Quiz")
        quizButton.addTarget(self, action: #selector(ViewController.didTapQuizButton), for: .touchUpInside)
    }
    
    private func updateButtonTitle(button: UIButton, title: String?) {
        guard let title = title else {
            return
        }
        
        let attributedTitle = NSAttributedString(string: title, attributes: buttonAttributes())
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
    
    private func buttonAttributes() -> [NSAttributedStringKey:Any] {
        let size: CGFloat = traitCollection.horizontalSizeClass == .regular ? 30 : 20
        let font = UIFont(name: "Times New Roman", size: size)!
        return [
            .font:font,
            .foregroundColor: UIColor.black
        ]
    }
}
