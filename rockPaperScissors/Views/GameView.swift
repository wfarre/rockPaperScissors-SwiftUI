////
////  GameView.swift
////  rockPaperScissors
////
////  Created by William FARRE on 2025/10/27.
////
import SwiftUI

typealias Choices = GameViewModel.Choices

struct GameView: View {
    @ObservedObject var game: GameViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("bg-triangle")
                Spacer()
            }
            VStack{
                Spacer()
                HStack{
                    ChoiceButton(choice: .Rock){
                        game.play(playerChoice: .Rock)
                    }
                    Spacer()
                    ChoiceButton(choice: .Paper){
                        game.play(playerChoice: .Paper)
                    }
                }
                Spacer()
                ChoiceButton(choice: .Scissors){
                    game.play(playerChoice: .Scissors)
                }
                Spacer()
            }
            
        }
    }
}

 
