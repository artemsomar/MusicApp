//
//  SectionView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct SectionView: View {
    
    var sectionSongs: [Song]
    @Binding var isPlayerView: Bool
    
    var body: some View {
        VStack (spacing: 16) {
            ForEach(sectionSongs) { song in
                SongRowView(songName: song.songName, bandName: song.bandName)
                    .onTapGesture {
                        isPlayerView = true
                        print("Clicked")
                    }
                    .fullScreenCover(isPresented: $isPlayerView) {
                        PlayerView(song: song)
                    }
                    
            }
        }
        
    }
}

//#Preview {
//    
//    ZStack {
//        Color.background
//        
//        VStack (spacing: 40) {
//            SectionView(sectionSongs: [Song(songName: "...And so It Was", bandName: "$uicideboy$"), Song(songName: "no!", bandName: "Two:22"),Song(songName: "Cumberland Gap", bandName: "David Rawlings"),Song(songName: "ASTRO", bandName: "IVOXYGEN")])
//            
//            SectionView(sectionSongs: [Song(songName: "La La La", bandName: "Naughty Boy"),
//                                       Song(songName: "rockstar (feat. 21 Savage)", bandName: "Post Malone"),
//                                       Song(songName: "Limbo", bandName: "Freddie Dredd"),
//                                       Song(songName: "TEEN", bandName: "IVOXYGEN")])
//        }
//        
//    }
//}
