//
//  CharacterSelectionViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class CharacterSelectionViewController: UIViewController {
    
    let viewModel: AlphabetViewModel
    let scrollView = UIScrollView()
    
    init(viewModel: AlphabetViewModel = AlphabetViewModel()) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        setupScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = AlphabetViewModel()
        super.init(coder: aDecoder)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = .darkGray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
}
