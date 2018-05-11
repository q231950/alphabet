//
//  Quiz.swift
//  Alphabet
//
//  Created by Kim Dung-Pham on 30.04.18.
//  Copyright © 2018 elbedev. All rights reserved.
//

import Foundation

public class Quiz {
    private let alphabet: AlphabetViewModel
    internal var tasks = [QuizTask]()
    private var index: Int = 0
    
    public init(alphabet: AlphabetViewModel) {
        self.alphabet = alphabet
        setupTasks()
    }
    
    func currentTask() -> QuizTask? {
        if index >= tasks.count {
            return nil
        }
        
        return tasks[index]
    }
    
    func solveTask(solution: CharacterViewModel) -> ResultType {
        let task = tasks[index]
        index += 1
        if task.solution == solution {
            return .success(solution: solution)
        } else {
            return .mistake(solution: solution)
        }
    }
    
    private func setupTasks() {
        var randomTasks = [UInt32: QuizTask]()
        for (_, character) in alphabet.characters.enumerated() {
            let random = generateRandom(notContainedIn: randomTasks, elements: alphabet.characters)
            let optionsForCharacter = self.choices(for: character, options: alphabet.characters)
            var choices = randomize(elements: optionsForCharacter)
            choices = Array(choices[0...2])
            choices.append(character)
            choices = randomize(elements: choices)

            let task = QuizTask(solution: character, choices: choices)
            randomTasks[random] = task
        }
        let randomized = randomTasks.sorted { (element, other) -> Bool in
            return element.key > other.key
            }.compactMap({ element -> QuizTask in
                return element.value
            })

        tasks = Array(randomized[0...9]) // take sample of 10 questions
    }

    private func choices(for character: CharacterViewModel, options: [CharacterViewModel]) -> [CharacterViewModel] {
        var removedCharacter = options

        if let index = removedCharacter.index(of: character) {
            removedCharacter.remove(at: index)
        }

        return removedCharacter
    }

    private func randomize(elements: [CharacterViewModel]) -> [CharacterViewModel] {
        var randomElements = [UInt32: CharacterViewModel]()
        elements.forEach() { element in
            let random = generateRandom(notContainedIn: randomElements, elements: elements)
            randomElements[random] = element
        }

        let e:[CharacterViewModel] = randomElements.sorted { (t, tOther) -> Bool in
            return t.key > tOther.key
            }.compactMap { item -> CharacterViewModel in
                return item.value
        }

        print(String(describing: e.count))

        return e
    }

    private func generateRandom(notContainedIn: [UInt32: Any], elements: [CharacterViewModel]) -> UInt32 {
        let random = arc4random_uniform(UInt32(elements.count))
        return notContainedIn.index(forKey: random) == nil ? random : generateRandom(notContainedIn: notContainedIn,
                                                                                     elements: elements)
    }
}
