//
//  ViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let letterView: LetterView = UIView.fromNib()
    private let letterSelectionView = LetterSelectionView()
    private var expandedLetterViewConstraint: NSLayoutConstraint!
    private var collapsedLetterViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTapGestureRecognizer()
        
        setupLetterView()
        setupLetterSelectionView()
        
        layoutLetterViews()
        expandLetterView()
    }
    
    private func registerTapGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(sender:)))
        tapRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        toggleLetterViewState()
    }
    
    private func toggleLetterViewState() {
        animate {
            if self.expandedLetterViewConstraint.isActive {
                self.collapseLetterView()
            } else {
                self.expandLetterView()
            }
        }
    }
    
    private func animate(animations: @escaping () -> Swift.Void) {
        UIView.animate(withDuration: 0.3) {
            animations()
            self.view.layoutIfNeeded()
        }
    }
    
    private func expandLetterView() {
        NSLayoutConstraint.deactivate([collapsedLetterViewConstraint])
        NSLayoutConstraint.activate([expandedLetterViewConstraint])
    }
    
    private func collapseLetterView() {
        NSLayoutConstraint.deactivate([expandedLetterViewConstraint])
        NSLayoutConstraint.activate([collapsedLetterViewConstraint])
    }
    
    private func layoutLetterViews() {
        expandedLetterViewConstraint = NSLayoutConstraint(item: letterView, attribute: .height, relatedBy: .equal, toItem: letterSelectionView, attribute: .height, multiplier: 1.6, constant: 0)
        collapsedLetterViewConstraint = NSLayoutConstraint(item: letterSelectionView, attribute: .height, relatedBy: .equal, toItem: letterView, attribute: .height, multiplier: 1.6, constant: 0)
    }
    
    private func setupLetterView() {
        view.addSubview(letterView)
        letterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            letterView.topAnchor.constraint(equalTo: view.topAnchor),
            letterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            letterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
    
    private func setupLetterSelectionView() {
        view.addSubview(letterSelectionView)
        letterSelectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            letterSelectionView.topAnchor.constraint(equalTo: letterView.bottomAnchor),
            letterSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            letterSelectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            letterSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}

