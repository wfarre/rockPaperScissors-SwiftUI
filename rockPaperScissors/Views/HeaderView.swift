//
//  Header.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/26.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var game: GameViewModel
    var body: some View {
        HStack{
            Text("""
                 Rock
                 Paper
                 Scissors
                """)
                .font(.title3.bold())
                .textCase(.uppercase)
            Spacer()
            VStack{
                Text("score")
                    .font(.caption)
                
                Text("\(game.score)")
                    .font(.largeTitle.bold())
                    
            }
            .frame(width: 80, height: 72)
            .background(.white)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(20)
        .background(Color(hue:214/360, saturation: 0.47, brightness: 0.23))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(maxWidth: .infinity)
        .padding(1)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius:  12))
        .shadow(radius: 12)
    }
}

#Preview {
    HeaderView(game: GameViewModel())
}
