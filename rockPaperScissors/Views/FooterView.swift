//
//  FooterView.swift
//  rockPaperScissors
//
//  Created by William FARRE on 2025/10/27.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        Button("RULES") {
        }.padding(
            EdgeInsets(top: 16, leading: 38, bottom: 16, trailing: 38)
        )
        .background(
            Color(hue: 237 / 360, saturation: 0.48, brightness: 0.15)
        )
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(1)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 12)
        Spacer()
    }
}

#Preview {
    FooterView()
}
