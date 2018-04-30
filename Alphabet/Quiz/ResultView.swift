//
//  ResultView.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 30.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class ResultView: UIView {
    
    let resultLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        setupLabel()
        hideLabel()
        
        isUserInteractionEnabled = false
    }
    
    func showResult(success: Bool) {
        let message = success ? "👍": "👎"
        resultLabel.attributedText = NSAttributedString(string: message, style: .largeCharacterStyle, traitCollection: traitCollection)

        UIView.animate(withDuration: 0.3, animations: {
            self.resultLabel.alpha = 1
            let maximize = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            self.resultLabel.transform = maximize
        }) { (_) in
            self.hideLabel()
        }
    }
    
    func hideLabel() {
        UIView.animate(withDuration: 0.3) {
            self.resultLabel.alpha = 0
            let minimize = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.resultLabel.transform = minimize
        }
    }
    
    func setupLabel() {
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: topAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
