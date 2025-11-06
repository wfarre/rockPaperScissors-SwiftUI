//
//  ResultView.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/27.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var game: GameViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if let playerChoice = game.playerChoice {
                    ChoiceButton(
                        choice: playerChoice,
                        action: { print("already selected") }
                    )
                }
                Spacer()
                if let computerChoice = game.computerChoice {
                    ChoiceButton(
                        choice: computerChoice,
                        action: { print("already selected") }
                    )
                }
                
            }
            Spacer()
            Text(
                game.winner == .win
                ? "You Win"
                : game.winner == .lose
                ? "You Lose" : "It's a Tie"
            )
            .textCase(.uppercase)
            .font(.largeTitle.bold())
            
            Button("Restart".uppercased()) {
                game.nextRound()
            }.frame(width: 200, height: 48)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundStyle(.blue)
            Spacer()
        }
    }
}

#Preview {
    ResultView(game: GameViewModel())
}
