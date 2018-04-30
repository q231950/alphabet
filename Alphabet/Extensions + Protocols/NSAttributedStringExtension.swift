//
//  NSAttributedStringExtension.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 30.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

enum AttributedStringStyle: Int {
    case largeButtonStyle
    case largeDarkButtonStyle
    case largeCharacterStyle
    case largeTextStyle
}

extension NSAttributedString {
    
    convenience init(string: String, style: AttributedStringStyle, traitCollection: UITraitCollection) {
        let attributes: [NSAttributedStringKey: Any]
        switch style {
        case .largeButtonStyle:
            attributes = NSAttributedString.largeButtonAttributes(for: traitCollection, color: .black)
        case .largeDarkButtonStyle:
            attributes = NSAttributedString.largeButtonAttributes(for: traitCollection, color: .white)
        case .largeCharacterStyle:
            attributes = NSAttributedString.largeCharacterAttributes(for: traitCollection, color: .black)
        case .largeTextStyle:
            attributes = NSAttributedString.largeTextAttributes(for: traitCollection, color: .black)
        }
    
        
        self.init(string: string, attributes: attributes)
    }
    
    /// @return the attributes to be used for displaying a large character
    static func largeTextAttributes(for traitCollection: UITraitCollection, color: UIColor) -> [NSAttributedStringKey:Any] {
        let textStyle: UIFontTextStyle = traitCollection.horizontalSizeClass == .regular ? .largeTitle : .title1
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let pointSize: CGFloat = fontDescriptor.pointSize
        let font = UIFont(name: "Times New Roman", size: pointSize)!
        
        return [
            .font:font,
            .foregroundColor: color
        ]
    }
    
    /// @return the attributes to be used for displaying a large character
    static func largeCharacterAttributes(for traitCollection: UITraitCollection, color: UIColor) -> [NSAttributedStringKey:Any] {
        let textStyle: UIFontTextStyle = traitCollection.horizontalSizeClass == .regular ? .largeTitle : .title1
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let pointSize: CGFloat = fontDescriptor.pointSize * 2.5
        let font = UIFont(name: "Times New Roman", size: pointSize)!
        
        return [
            .font:font,
            .foregroundColor: color
            ]
    }
    
    /// @return the attributes to be used for large buttons
    static func largeButtonAttributes(for traitCollection: UITraitCollection, color: UIColor) -> [NSAttributedStringKey:Any] {
        let textStyle: UIFontTextStyle = traitCollection.horizontalSizeClass == .regular ? .largeTitle : .title2
        return attributes(color: color, textStyle:textStyle)
    }
    
    private static func attributes(color: UIColor, textStyle: UIFontTextStyle) -> [NSAttributedStringKey: Any] {
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let pointSize = fontDescriptor.pointSize
        let font = UIFont(name: "Times New Roman", size: pointSize)!
        
        return [
            .font:font,
            .foregroundColor: color
        ]
    }

}
