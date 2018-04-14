//
//  ViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let letterView: LetterView = UIView.fromNib()
        letterView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letterView)
        NSLayoutConstraint.activate([
            letterView.topAnchor.constraint(equalTo: view.topAnchor),
            letterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            letterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            letterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

