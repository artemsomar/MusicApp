//
//  MusicApp.swift
//  Music
//
//  Created by Artem Somar on 23.05.2024.
//

import SwiftUI

@main
struct MusicApp: App {
    
    @StateObject var apiService = SpotifyApiService()
    @State var showAuthView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if showAuthView {

                SpotifyAuthView(showWebView: $showAuthView)
                    .ignoresSafeArea()
                    .environmentObject(apiService)
            } else {
                NavigationStack {
                    HomeView()
                        .environmentObject(apiService)
                }
            }
            
            
            
        }
    }
}
