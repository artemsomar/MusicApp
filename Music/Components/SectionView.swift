//
//  SectionView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct SectionView: View {
    
    @Binding var demonstrationSong: Song
    var sectionSongs: [Song]
    @Binding var isPlayerView: Bool
    
    var body: some View {
        VStack (spacing: 16) {
            ForEach(sectionSongs) { song in
                SongRowView(songName: song.songName, bandName: song.bandName)
                    .onTapGesture {
                        demonstrationSong = song
                        isPlayerView = true
                        print("Clicked \(song.songName)")
                    }
                    .fullScreenCover(isPresented: $isPlayerView) {
                        
                        PlayerView(song: $demonstrationSong, isPlayerView: $isPlayerView)
                    }
                    
            }
        }
        
    }
}

#Preview {
    
    ZStack {
        Color.background
        
        VStack (spacing: 40) {
            SectionView(demonstrationSong: .constant(Song(songName: "error", bandName: "error")), sectionSongs: [Song(songName: "...And so It Was", bandName: "$uicideboy$"), Song(songName: "no!", bandName: "Two:22"),Song(songName: "Cumberland Gap", bandName: "David Rawlings"),Song(songName: "ASTRO", bandName: "IVOXYGEN")], isPlayerView: .constant(false))
        }
        
    }
}
