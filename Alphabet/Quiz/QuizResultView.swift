//
//  QuizResultView.swift
//  Alphabet
//
//  Created by Martin Kim Dung-Pham on 5/6/18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class QuizResultView: UIView {

    let emojiLabel = UILabel()
    let titleLabel = UILabel()
    let resultLabel = UILabel()
    let closeButton = UIButton(type: .custom)
    let margin: CGFloat = 20

    init(resultViewModel: QuizResultViewModel) {
        super.init(frame: .zero)

        backgroundColor = .white

        layoutEmojiLabel(resultViewModel)
        layoutTitleLabel(resultViewModel)
        layoutResultLabel(resultViewModel)
        layoutCloseButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func layoutEmojiLabel(_ viewModel: QuizResultViewModel) {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emojiLabel)
        emojiLabel.textAlignment = .center
        emojiLabel.attributedText = viewModel.emoji
        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            emojiLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            emojiLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])
    }

    private func layoutTitleLabel(_ viewModel: QuizResultViewModel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.attributedText = viewModel.title
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            ])
    }

    private func layoutResultLabel(_ viewModel: QuizResultViewModel) {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resultLabel)
        resultLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        resultLabel.numberOfLines = 0
        resultLabel.attributedText = viewModel.result
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin),
            resultLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
    }

    private func layoutCloseButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        let title = NSAttributedString(string: "Ok", style: .largeButtonStyle, traitCollection: traitCollection)
        closeButton.setAttributedTitle(title, for: .normal)
        closeButton.layer.backgroundColor = UIColor(white: 0.9, alpha: 1).cgColor
        closeButton.layer.cornerRadius = 5
        closeButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(greaterThanOrEqualTo: resultLabel.bottomAnchor, constant: margin),
            closeButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -3 * margin),
            closeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }
}
