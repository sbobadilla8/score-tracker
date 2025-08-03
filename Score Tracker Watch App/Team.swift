//
//  Player.swift
//  Score Tracker
//
//  Created by Sebastian Bobadilla on 7/5/25.
//

import Foundation
import SwiftData

@Model
class Team {
    var currentScore: Int
    var setsWon: Int
    var gameWon: Bool
    
    init(currentScore: Int = 0, setsWon: Int = 0, gameWon: Bool = false) {
        self.currentScore = currentScore
        self.setsWon = setsWon
        self.gameWon = gameWon
    }
    
    func increaseScore() {
        currentScore += 1
    }
    
    func decreaseScore() {
        if currentScore > 0 {
            currentScore -= 1
        }
    }
    
    func resetScore() {
        currentScore = 0
    }
    
    func increaseSetsWon() {
        setsWon += 1
    }
    
    static var mockTeams: [Team] {
        [
            Team(currentScore: 0, setsWon: 0, gameWon: false),
            Team(currentScore: 0, setsWon: 0, gameWon: false),
        ]
    }
}
