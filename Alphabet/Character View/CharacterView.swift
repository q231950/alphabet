//
//  CharacterView.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

@IBDesignable
class CharacterView: UIView {
    
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var characterViewModel: CharacterViewModel? {
        didSet {
            characterLabel.text = characterViewModel?.character
            characterNameLabel.text = characterViewModel?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var borderColor: UIColor? = .darkGray
}
