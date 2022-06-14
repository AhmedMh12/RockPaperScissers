//
//  ContentView.swift
//  Shared
//
//  Created by Ahmed Mahouchi on 14/6/2022.
//

import SwiftUI

struct ContentView : View {
    
    @ObservedObject var game = GameLogic()
    
    @State private var player2UsingAI = true //Local multiplayer = WIP
    @State private var aiDifficulty = 10
    @State private var showRestartConfirmation = false
    
    var body: some View {
        

        
        var streakExists: Bool {
            return game.state.player1Streak > 0 || game.state.player2Streak > 0
        }
        return NavigationView {
            
            Group {
                ScoreLabels(player1: "You",
                            player2: "Computer",
                            score1: String(game.state.player1Score),
                            score2: String(game.state.player2Score),
                            turn: game.state.turn)
                
                HStack {
                    ForEach (RockPaperScissors.allCases, id: \.self) { option in
                        Button(action: {
                            self.playTurn(with: option)
                        }) {
                            Image(option.rawValue)
                                .padding()
                                
                                
                        }
                    }
                }
                
                
                
                HStack {
                    Button(action: {
                        self.game.startOver()
                    }) {
                        Text("Restart Game")
                    }
                }
                
               
                
                ChoicesList(moves: game.state.moves,
                                  player1:  "You",
                                  player2: "Computer")
                .background(Color.init(hex: "#455A84"))
            }
            .background(Color.init(hex: "#455A84"))
            .navigationBarTitle(Text("Welcome"))
            .navigationBarItems(
                    leading:   Text("") ,
                    trailing: Text("")
            )
            
            
        }
    }
    
    func playTurn(with selectedOption: RockPaperScissors) {
        
        if player2UsingAI {
            
            game.player1Move = selectedOption
            game.player2Move = Game().playTurnWithAI(previousTurns: game.state.moves, difficulty: aiDifficulty)
            
        } else {
            
            switch game.turn {
            case .player1:
                game.player1Move = selectedOption
            case .player2:
                game.player2Move = selectedOption
            }
        }
        
        _ = game.playTurn()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
