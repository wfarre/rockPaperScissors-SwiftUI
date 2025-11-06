//
//  GameViewModel.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/27.
//

import Foundation
import Combine

@MainActor
class GameViewModel: ObservableObject {
    @Published var score: Int = 0
    @Published var playerChoice: Choices?
    @Published var computerChoice: Choices?
    @Published var winner: GameResult?
    @Published var round: Int = 0
    @Published var showGameOverAlert: Bool = false
    
    var isGameOver: Bool  {
        round >= 10
    }
    
    enum Choices: String, CaseIterable {
        case Rock = "rock"
        case Paper = "paper"
        case Scissors = "scissors"
    }
    
    enum GameResult: String {
        case win = "You Win!"
        case lose = "Computer Wins!"
        case tie = "It's a Tie!"
    }
    
    func play(playerChoice: Choices) {
        self.playerChoice = playerChoice
        self.computerChoice = Choices.allCases.randomElement()!
        
        guard let computerChoice = self.computerChoice else { return }
        
        let result = determineWinner(playerChoice: playerChoice, computerChoice: computerChoice)
        self.winner = result
        
        switch result {
        case .win:
            score += 1
        case .lose:
            score -= 1
        case .tie:
            break
        }
        
        round += 1
        
        // Check if game is over and show alert
        if isGameOver {
            showGameOverAlert = true
        }
    }
    
    private func determineWinner(playerChoice: Choices, computerChoice: Choices) -> GameResult {
        if playerChoice == computerChoice {
            return .tie
        }
        
        switch (playerChoice, computerChoice) {
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            return .win
        default:
            return .lose
        }
    }
    
    func resetGame() {
        score = 0
        playerChoice = nil
        computerChoice = nil
        winner = nil
        round = 0
        showGameOverAlert = false
    }
    
    func nextRound() {
        playerChoice = nil
        computerChoice = nil
        winner = nil
    }
    
    var gameStatus: String {
        if let result = winner {
            return result.rawValue
        }
        return "Make your choice!"
    }
}
