//
//  Song.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import Foundation

class Song: Identifiable {
    var id = UUID().uuidString
    var songName: String
    var bandName: String
    
    init(songName: String, bandName: String) {
        self.songName = songName
        self.bandName = bandName
    }
}
