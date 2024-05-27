//
//  CircledButton.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct CircledButton: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(Color.text)
            .font(.subheadline)
            .padding(5)
            .padding(.horizontal, 5)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.secondaryText, lineWidth: 0.8)
            )
    }
}

#Preview {
    
    ZStack {
        Color.background
        
        CircledButton(text: "Play all")
    }
}
