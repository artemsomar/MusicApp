//
//  HomeView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @State private var isPlayerView = false
    @State private var authorizationCode: String? = nil
    @EnvironmentObject var apiService: SpotifyApiService
    
    var body: some View {
               
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.secondBackground, Color.background]), startPoint: .top, endPoint: .bottom)
            VStack {
                HeaderView()
                ScrollView (.vertical) {
                    VStack {
                        QuickPicksView(apiService: apiService, isPlayerView: $isPlayerView)
                            .padding(.vertical, 30)
                            
                    }
                }
                
                FooterView()
            }
            
            
        }
        .task {
            
        }
    }
}
//
//#Preview {
//    HomeView()
//}
