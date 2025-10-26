//
//  GameView.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/27.
//
import SwiftUI

struct GameView: View {
    @ObservedObject var game: GameViewModel
    @State private var userChoice: Choice? = nil
    
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
                                       userChoice = .Rock
                                       game.play(playerChoice: .Rock)
                                   }
                                   Spacer()
                                   ChoiceButton(choice: .Paper){
                                       userChoice = .Paper
                                       game.play(playerChoice: .Paper)

                                   }
                               }
                               Spacer()
                               ChoiceButton(choice: .Scissors){
                                   userChoice = .Scissors
                                   game.play(playerChoice: .Scissors)

                               }
                           Spacer()
                           }
                           
                       }
    }
}

 
