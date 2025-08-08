//
//  Sports.swift
//  Score Tracker
//
//  Created by Sebastian Bobadilla on 7/5/25.
//

import Foundation
import SwiftData

enum SportName: String, CaseIterable {
    case padel
    case pingpong
    case tennis
}

@Observable
class Sport {
    var playersPerTeam: Int
    var numberOfSets: Int
    var pointsPerSet: Int
    var scoringScheme: [Int]
    var goldenPoint: Bool
    
    init(playersPerTeam: Int, numberOfSets: Int, pointsPerSet: Int, scoringScheme: [Int], goldenPoint: Bool) {
        self.playersPerTeam = playersPerTeam
        self.numberOfSets = numberOfSets
        self.pointsPerSet = pointsPerSet
        self.scoringScheme = scoringScheme
        self.goldenPoint = goldenPoint
    }
    
    func handleScore(scoringTeam: Team, otherTeam: Team) {}
}

class Padel: Sport {
    init() {
        super.init(
            playersPerTeam: 2,
            numberOfSets: 6,
            pointsPerSet: 4,
            scoringScheme: [0, 15, 30, 40, 45],
            goldenPoint: false
        )
    }
    
    override func handleScore(scoringTeam: Team, otherTeam: Team) {
        if (scoringTeam.currentScore < pointsPerSet - 1) {
            scoringTeam.increaseScore()
        } else {
            if (!goldenPoint) {
                if (scoringTeam.currentScore == pointsPerSet - 1 && otherTeam.currentScore < pointsPerSet - 1) {
                    scoringTeam.increaseSetsWon()
                    scoringTeam.resetScore()
                    otherTeam.resetScore()
                } else if (scoringTeam.currentScore == pointsPerSet && otherTeam.currentScore == pointsPerSet - 1) {
                    scoringTeam.increaseSetsWon()
                    scoringTeam.resetScore()
                    otherTeam.resetScore()
                } else if (otherTeam.currentScore == pointsPerSet) {
                    otherTeam.decreaseScore()
                } else {
                    scoringTeam.increaseScore()
                }
            } else {
                scoringTeam.increaseSetsWon()
                scoringTeam.resetScore()
                otherTeam.resetScore()
            }
        }
    }
}

class Pingpong: Sport {
    init() {
        super.init(
            playersPerTeam: 1,
            numberOfSets: 3,
            pointsPerSet: 11,
            scoringScheme: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
            goldenPoint: false
        )
    }
    
    override func handleScore(scoringTeam: Team, otherTeam: Team) {
        if (scoringTeam.currentScore >= pointsPerSet - 1 && otherTeam.currentScore <= scoringTeam.currentScore - 1) {
            scoringTeam.increaseSetsWon()
            scoringTeam.resetScore()
            otherTeam.resetScore()
        } else {
            scoringTeam.increaseScore()
        }
    }
}


class Tennis: Sport {
    init() {
        super.init(
            playersPerTeam: 1,
            numberOfSets: 5,
            pointsPerSet: 5,
            scoringScheme: [0, 15, 30, 40, 45],
            goldenPoint: false
        )
    }
}
