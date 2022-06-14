//
//  ChoicesList.swift
//  rockPaperScissorsGame (iOS)
//
//  Created by Ahmed Mahouchi on 14/6/2022.
//

import SwiftUI

struct ChoicesList : View {
    
    var moves: [Turn]
    var player1, player2: String
    
    var body : some View {
        
        var reversedMoves = [Turn]()
        reversedMoves.append(contentsOf: moves.reversed())
        
        return List (reversedMoves) { turn in
            HStack {
                VStack(alignment: .leading) {
                    Text(self.player1).font(.headline)
                    Text("\(turn.player1Move.rawValue)").font(.subheadline)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(self.player2).font(.headline)
                    Text("\(turn.player2Move.rawValue)").font(.subheadline)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Winner").font(.headline)
                    
                    if turn.winner == .player1 {
                        Text(self.player1).font(.subheadline)
                    } else if turn.winner == .player2 {
                        Text(self.player2).font(.subheadline)
                    } else {
                        Text("No winner").font(.subheadline)
                    }
                }
            }
        }
        .background(Color.init(hex: "#455A84"))
    }
}


