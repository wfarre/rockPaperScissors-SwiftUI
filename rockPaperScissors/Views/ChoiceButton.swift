//
//  ChoiceButton.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/26.
//

import SwiftUI

struct ChoiceButton: View {
    let choice: Choices
    var color: Color {
        switch choice {
        case .Rock:
            return .red
        case .Paper:
            return .blue
        case .Scissors:
            return .yellow
        }
    }
    
    var action: () -> Void
    
    
    var body: some View {
        Button{
            action()
        }label: {
            Image(choice.rawValue)
        }
        .padding()
        .shadow(color: .black.opacity(0.5), radius: 25, x: -25, y: -25)
        .background(.white)
        .clipShape(.circle)
        .padding()
        .background(color.gradient)
        .clipShape(.circle)
    }
}

#Preview {
    ChoiceButton(choice: Choices.Rock, action: {print("hello")})
}
