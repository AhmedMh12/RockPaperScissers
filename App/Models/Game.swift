//
//  Game.swift
//  rockPaperScissorsGame (iOS)
//
//  Created by Ahmed Mahouchi on 14/6/2022.
//

import Foundation

class Game {
    
    func playTurnWithAI(previousTurns: [Turn], difficulty: Int) -> RockPaperScissors {
        
        RockPaperScissors.allCases.randomElement() ?? .rock
        
    }
}

extension Array where Element: Hashable {
    var mode: Element? {
        return self.reduce([Element: Int]()) {
            var counts = $0
            counts[$1] = ($0[$1] ?? 0) + 1
            return counts
            }.max { $0.1 < $1.1 }?.0
    }
}

struct User {
    var name: String
    var age: Int
}
