//
//  Quiz.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 30.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

class Quiz {
    private let alphabet: AlphabetViewModel
    private var tasks = [CharacterViewModel]()
    private var index: Int = 0
    
    init(alphabet: AlphabetViewModel) {
        self.alphabet = alphabet
        setupTasks()
    }
    
    var choices: AlphabetViewModel {
        get {
            return alphabet
        }
    }
    
    func currentTask() -> CharacterViewModel? {
        return tasks[index]
    }
    
    func solveTask(solution: CharacterViewModel) -> Bool {
        let task = tasks[index]
        index += 1
        return task == solution
    }
    
    private func selectFirstTask() -> CharacterViewModel? {
        let taskInProgress = tasks.first
        return taskInProgress
    }
    
    private func setupTasks() {
        var randomTasks = [UInt32: CharacterViewModel]()
        for (_, character) in alphabet.characters.enumerated() {
            let random = arc4random_uniform(UInt32(alphabet.characters.count))
            randomTasks[random] = character
        }
        tasks = randomTasks.sorted { (element, other) -> Bool in
            return element.key > other.key
            }.compactMap({ element -> CharacterViewModel in
                return element.value
            })
    }
}
