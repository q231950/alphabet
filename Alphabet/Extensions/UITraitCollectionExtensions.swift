//
//  UITraitCollectionExtensions.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 24.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension UITraitCollection {
    static func axis(for traitCollection: UITraitCollection) -> UILayoutConstraintAxis {
        let regularHeight = traitCollection.verticalSizeClass == .regular
        let regularWidth = traitCollection.horizontalSizeClass == .regular
        let axis = (regularHeight && !regularWidth) ? UILayoutConstraintAxis.vertical : UILayoutConstraintAxis.horizontal
        return axis
    }
}
