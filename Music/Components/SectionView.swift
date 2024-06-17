//
//  SectionView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct SectionView: View {
    
    @Binding var demonstrationSong: Track?
    var sectionSongs: [Track]
    @Binding var isPlayerView: Bool
    
    var body: some View {
        VStack (spacing: 16) {

            ForEach(0..<sectionSongs.count, id:\.self) { index in
                ZStack {
                    Color.gray.opacity(0.001)
                    SongRowView(song: sectionSongs[index])
                }
                .onTapGesture {
                    demonstrationSong = sectionSongs[index]
                    isPlayerView = true
                    print("Clicked \(sectionSongs[index].name)")
                }
                .fullScreenCover(isPresented: $isPlayerView) {
                    
                    PlayerView(song: $demonstrationSong, isPlayerView: $isPlayerView)
                    
                    
                }
            }
        }
        
    }
}

