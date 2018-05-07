//
//  QuizChoiceViewController.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/3/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class QuizChoiceViewController: UIViewController {

    var characterSelectable: CharacterSelectable? = nil
    let firstRowStackView = UIStackView()
    let secondRowStackView = UIStackView()
    let topLeftChoice = UIButton(type: UIButtonType.roundedRect)
    let topRightChoice = UIButton(type: UIButtonType.roundedRect)
    let bottomLeftChoice = UIButton(type: UIButtonType.roundedRect)
    let bottomRightChoice = UIButton(type: UIButtonType.roundedRect)
    let buttonContentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    var buttonSolutionMapping = [UIButton: CharacterViewModel]()
    let spacing: CGFloat = 6
    var enabled: Bool = true {
        didSet {
            topLeftChoice.isUserInteractionEnabled = enabled
            topRightChoice.isUserInteractionEnabled = enabled
            bottomLeftChoice.isUserInteractionEnabled = enabled
            bottomRightChoice.isUserInteractionEnabled = enabled
        }
    }

    init(characterSelectable: CharacterSelectable?) {
        self.characterSelectable = characterSelectable

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 0.4, alpha: 1)

        setupChoiceViews()
    }

    // Choices must contain 4 elements
    func update(with task: QuizTask) {
        task.choices.enumerated().forEach { (index, choice) in
            let title = NSAttributedString(string: choice.name, style: .largeDarkButtonStyle, traitCollection: traitCollection)
            switch index {
            case 0:
                buttonSolutionMapping[topLeftChoice] = choice
                topLeftChoice.setAttributedTitle(title, for: .normal)
            case 1:
                buttonSolutionMapping[topRightChoice] = choice
                topRightChoice.setAttributedTitle(title, for: .normal)
            case 2:
                buttonSolutionMapping[bottomLeftChoice] = choice
                bottomLeftChoice.setAttributedTitle(title, for: .normal)
            case 3:
                buttonSolutionMapping[bottomRightChoice] = choice
                bottomRightChoice.setAttributedTitle(title, for: .normal)
            default:
                break // do nothing
            }
        }
    }

    private func setupChoiceViews() {
        setupButtons([topLeftChoice, topRightChoice, bottomLeftChoice, bottomRightChoice])
        setupFirstRowStackView()
        setupSecondRowStackView()
    }

    private func setupButtons(_ buttons: [UIButton]) {
        buttons.forEach { (button) in
            button.contentEdgeInsets = buttonContentEdgeInsets
            button.addTarget(self, action: #selector(selectChoice(sender:)), for: .touchUpInside)
        }
    }

    @objc func selectChoice(sender: UIButton) {
        if let choice = buttonSolutionMapping[sender] {
            characterSelectable?.didSelectCharacterViewModel(choice)
        }
    }

    private func setupFirstRowStackView() {
        view.addSubview(firstRowStackView)
        firstRowStackView.translatesAutoresizingMaskIntoConstraints = false
        firstRowStackView.axis = .horizontal
        firstRowStackView.alignment = .center
        firstRowStackView.distribution = .fillEqually
        firstRowStackView.isLayoutMarginsRelativeArrangement = true
        firstRowStackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 5, right: 0)
        firstRowStackView.spacing = spacing
        NSLayoutConstraint.activate([
            firstRowStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            firstRowStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            firstRowStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])
        firstRowStackView.addArrangedSubview(topLeftChoice)
        firstRowStackView.addArrangedSubview(topRightChoice)
    }

    private func setupSecondRowStackView() {
        view.addSubview(secondRowStackView)
        secondRowStackView.translatesAutoresizingMaskIntoConstraints = false
        secondRowStackView.axis = .horizontal
        secondRowStackView.alignment = .center
        secondRowStackView.distribution = .fillEqually
        secondRowStackView.isLayoutMarginsRelativeArrangement = true
        secondRowStackView.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 20, right: 0)
        secondRowStackView.spacing = spacing
        NSLayoutConstraint.activate([
            secondRowStackView.topAnchor.constraint(equalTo: firstRowStackView.bottomAnchor),
            secondRowStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            secondRowStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            secondRowStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])
        secondRowStackView.addArrangedSubview(bottomLeftChoice)
        secondRowStackView.addArrangedSubview(bottomRightChoice)
    }
}
