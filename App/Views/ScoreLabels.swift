//
//  ScoreLabels.swift
//  rockPaperScissorsGame (iOS)
//
//  Created by Ahmed Mahouchi on 14/6/2022.
//

import SwiftUI

struct ScoreLabels : View {
    
    var player1, player2, score1, score2: String
    var turn: Player
    
    var body : some View {
        
        HStack {
            
            VStack {
                Text(player1)
                Text(score1)
                    .font(.title)
            }
            
            Spacer()
            
           
            
            VStack {
                Text(player2)
                Text(score2)
                    .font(.title)
            }
            
            }
       // .background(Color.init(hex: "#455A84"))
            .padding()
    }
}

