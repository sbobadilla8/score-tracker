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
}

class Padel: Sport {
    init() {
        super.init(
            playersPerTeam: 2,
            numberOfSets: 6,
            pointsPerSet: 5,
            scoringScheme: [0, 15, 30, 40, 45],
            goldenPoint: false
        )
    }
}

class Pingpong: Sport {
    init() {
        super.init(
            playersPerTeam: 1,
            numberOfSets: 3,
            pointsPerSet: 12,
            scoringScheme: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
            goldenPoint: false
        )
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
