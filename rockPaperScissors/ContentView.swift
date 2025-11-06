//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameViewModel()
    

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(hue: 214 / 360, saturation: 0.47, brightness: 0.23),
                Color(hue: 237 / 360, saturation: 0.48, brightness: 0.15),
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
            
            VStack {
                HeaderView(game: game)
                Spacer()
                ZStack{
                    GameView(game: game)
                        .opacity(game.winner != nil ? 0 : 1)
                        .animation(.default, value: game.winner == nil)
                    ResultView(game: game)
                        .opacity(game.winner == nil ? 0 : 1)
                        .animation(.default, value: game.winner != nil)
                }
                    
                        
              
                    
                Spacer()
                Spacer()
                FooterView()
            }
            .padding(32)
            .alert("Game Over", isPresented: $game.showGameOverAlert) {
                Button("Reset"){
                    game.resetGame()
                }
            }
            .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    ContentView()
}
