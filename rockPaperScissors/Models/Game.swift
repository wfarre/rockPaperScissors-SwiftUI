//
//  Game.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/26.
//

import SwiftUI

struct Game{
    public var score = 0
    private var round = 0
    public var winner: String? = nil
    public var playerChoice: Choices? = nil
    public var computerChoice: Choices? = nil
    
    private func getWinner(userChoice: Choices, computerChoice: Choices) -> String{
        switch (userChoice, computerChoice) {
        case (.Rock, .Scissors):
            return "user"
        case (.Scissors, .Paper):
            return "user"
        case (.Paper, .Rock):
            return "user"
        case (.Scissors, .Rock):
            return "computer"
        case (.Paper, .Scissors):
            return "computer"
        case (.Rock, .Paper):
            return "computer"
        default:
            return "draw"
        }
    }
    
    mutating func nextRound(){
        self.round += 1
        self.playerChoice = nil
        self.computerChoice = nil
        self.winner = nil
    }
    
    mutating func play(playerChoice: Choices){
        self.playerChoice = playerChoice
        self.computerChoice = Choices.allCases.randomElement()
        print("hello")
        if let playerChoice = self.playerChoice, let computerChoice = self.computerChoice {
            self.winner = getWinner(userChoice: playerChoice, computerChoice: computerChoice)
            if self.winner == "user" {
                self.score += 1
            } else if self.winner == "computer" {
                self.score -= 1
            } 
        }
        print(self.score)
        
    }
        
    
}
