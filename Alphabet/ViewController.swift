//
//  ViewController.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 14.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import UIKit

extension ViewController: CharacterSelectable {
    func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel) {
        print("didSelectCharacter(\(characterViewModel.character))")
        characterSelectionViewController.select(character: characterViewModel)
        characterView.characterViewModel = characterViewModel
        view.layoutIfNeeded()
        animate {
            self.expandCharacterView()
        }
    }
}

class ViewController: UIViewController {
    
    private let characterView = CharacterView()
    private var characterSelectionViewController: CharacterSelectionViewController!
    private var expandedCharacterViewConstraint: NSLayoutConstraint!
    private var collapsedCharacterViewConstraint: NSLayoutConstraint!
    private var activeHeightConstraint: NSLayoutConstraint!
    private var panOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterSelectionViewController = CharacterSelectionViewController(alphabet: .greek, characterSelectable: self)
        
        registerGestureRecognizers()
        
        setupCharacterView()
        setupCharacterSelectionViewController()
        
        layoutCharacterViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let character = CharacterViewModel(character: "α", capitalCharacter: "Α", name: "alpha".localizedLowercase)
        characterView.characterViewModel = character
        characterSelectionViewController.select(character: character)
    }
    
    private func registerGestureRecognizers() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(sender:)))
        tapRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapRecognizer)

        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.pan(sender:)))
        view.addGestureRecognizer(panRecognizer)
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        toggleCharacterViewState()
    }

    @objc func pan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            panOrigin = sender.translation(in: self.view)
        case .changed:
            let offsetY = offset(sender: sender)
            updateCharacterViewLayout(with: offsetY)
        case .ended:
            let offsetY = offset(sender: sender)
            animate {
                self.activeHeightConstraint.constant = 0
                if offsetY < 0 {
                    self.collapseCharacterView()
                } else {
                    self.expandCharacterView()
                }
                self.panOrigin = nil
            }
        default:
            panOrigin = nil
        }
    }

    private func offset(sender: UIPanGestureRecognizer) -> CGFloat{
        guard let panOrigin = panOrigin else {
            return 0
        }
        let currentPoint = sender.translation(in: self.view)
        return currentPoint.y - panOrigin.y
    }

    private func updateCharacterViewLayout(with offset: CGFloat) {
        view.setNeedsLayout()
        activeHeightConstraint.constant = expandedCharacterViewConstraint.isActive ? -offset : offset
        view.layoutIfNeeded()
    }
    
    private func toggleCharacterViewState() {
        animate {
            self.activeHeightConstraint.constant = 0
            if self.expandedCharacterViewConstraint.isActive {
                self.collapseCharacterView()
            } else {
                self.expandCharacterView()
            }
        }
    }
    
    private func animate(animations: @escaping () -> Swift.Void) {
        UIView.animate(withDuration: 0.3) {
            animations()
            self.view.layoutIfNeeded()
        }
    }
    
    private func expandCharacterView() {
        NSLayoutConstraint.deactivate([collapsedCharacterViewConstraint])
        NSLayoutConstraint.activate([expandedCharacterViewConstraint])
        activeHeightConstraint = expandedCharacterViewConstraint
    }
    
    private func collapseCharacterView() {
        NSLayoutConstraint.deactivate([expandedCharacterViewConstraint])
        NSLayoutConstraint.activate([collapsedCharacterViewConstraint])
        activeHeightConstraint = collapsedCharacterViewConstraint
    }
    
    private func layoutCharacterViews() {
        expandedCharacterViewConstraint = NSLayoutConstraint(item: characterSelectionViewController.view, attribute: .height, relatedBy: .equal, toItem: characterView, attribute: .height, multiplier: 0.5, constant: 0)
        expandedCharacterViewConstraint.priority = .defaultLow
        collapsedCharacterViewConstraint = NSLayoutConstraint(item: characterView, attribute: .height, relatedBy: .equal, toItem: characterSelectionViewController.view, attribute: .height, multiplier: 0.5, constant: 0)
        collapsedCharacterViewConstraint.priority = .defaultLow

        expandedCharacterViewConstraint.isActive = true
        activeHeightConstraint = expandedCharacterViewConstraint
    }
    
    private func setupCharacterView() {
        view.addSubview(characterView)
        characterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.topAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
    
    private func setupCharacterSelectionViewController() {
        addChildViewController(characterSelectionViewController)
        view.addSubview(characterSelectionViewController.view)
        characterSelectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterSelectionViewController.view.topAnchor.constraint(equalTo: characterView.bottomAnchor),
            characterSelectionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterSelectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterSelectionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            ])
    }
}

