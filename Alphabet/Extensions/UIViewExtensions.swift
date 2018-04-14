//
//  UIViewExtensions.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension UIView {
    static func fromNib<T: UIView>() -> T {
        let nibName = String(describing: T.self)
        return Bundle.main.loadNibNamed(nibName, owner: self)!.first! as! T
    }
}
