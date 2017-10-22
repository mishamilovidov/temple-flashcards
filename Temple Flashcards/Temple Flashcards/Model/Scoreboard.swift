//
//  Scoreboard.swift
//  Temple Flashcards
//
//  Created by Misha Milovidov on 10/22/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation

class Scoreboard {
    
    // MARK: - Properties
    
    var correct = 0
    var incorrect = 0
    var attempts = 0
    
    // MARK: - Initialization
    
    init(correct: Int, incorrect: Int, attempts: Int) {
        self.correct = correct
        self.incorrect = incorrect
        self.attempts = attempts
    }
    
    // MARK: - Singleton pattern
    
    static let sharedInstance = Scoreboard()
    
    private init() {
        update()
    }
    
    // MARK: - Private Helpers
    
    private func update() {
        
    }
    
    private func addAttempt() {
        self.attempts += 1
    }
    
    // MARK: - Public Helpers
    
    public func addCorrect() {
        self.correct += 1
        addAttempt()
    }
    
    public func addIncorrect() {
        self.incorrect += 1
        addAttempt()
    }
    
    public func resetScoreboard() {
        self.correct = 0
        self.incorrect = 0
        self.attempts = 0
    }
    
}
