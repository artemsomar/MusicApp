//
//  FooterView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Image(systemName: "house")
                        .font(.title2)
                    Text("Home")
                        .font(.subheadline)
                        
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "chart.bar")
                        .font(.title2)
                    Text("Samples")
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "safari")
                        .font(.title2)
                    Text("Explore")
                        .font(.subheadline)
                }
                
                
                
                Spacer()
                
                VStack {
                    Image(systemName: "music.note.house")
                        .font(.title2)
                    Text("Library")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .foregroundStyle(Color.text)
            
        }
        .frame(height: 20)
    }
}

#Preview {
    VStack {
        Spacer()
        FooterView()
    }
    
}
