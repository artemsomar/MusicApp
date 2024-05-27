//
//  HomeView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPlayerView = false
    
    var body: some View {
        
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.secondBackground, Color.background]), startPoint: .top, endPoint: .bottom)
            VStack {
                HeaderView()
                ScrollView (.vertical) {
                    VStack {
                        
                        QuickPicksView(vm: QuickPicksViewModel(), isPlayerView: $isPlayerView)
                            .padding(.vertical, 30)
                        
                        
                    }
                }
                FooterView()
            }
            
            
            
        }
        
    }
}

#Preview {
    HomeView()
}
