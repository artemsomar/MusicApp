//
//  QuickPicksViewModel.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import Foundation
import SwiftUI

class QuickPicksViewModel: ObservableObject {
    
    var allPicksSongs: [Song] = [Song(songName: "...And so It Was", bandName: "$uicideboy$"),
                                 Song(songName: "no!", bandName: "Two:22"),
                                 Song(songName: "Cumberland Gap", bandName: "David Rawlings"),
                                 Song(songName: "ASTRO", bandName: "IVOXYGEN"),
                                 Song(songName: "La La La", bandName: "Naughty Boy"),
                                 Song(songName: "rockstar (feat. 21 Savage)", bandName: "Post Malone"),
                                 Song(songName: "Limbo", bandName: "Freddie Dredd"),
                                 Song(songName: "TEEN", bandName: "IVOXYGEN"),
                                 Song(songName: "By the Sword", bandName: "Iamjackhill"),
                                 Song(songName: "Leedle Leedle Lee", bandName: "TrippyTheKid"),
                                 Song(songName: "Us & Funs", bandName: "SebaLazi"),
                                 Song(songName: "ecstacy (slowed)", bandName: "SUICIDAL-IDOL"),
                                 Song(songName: "WhereTheTreesMeetTheFreeway", bandName: "BONES")]
    
    var sections: [[Song]] = []
    
    init() {
        devideToSections()
        
    }
    
    private func devideToSections() {
        var sectionSongs: [Song] = []
        for index in 0..<allPicksSongs.count {
            
            if index != 0 && index % 4 == 0 {
                sections.append(sectionSongs)
                sectionSongs = []
            }
            sectionSongs.append(allPicksSongs[index])
        }
    }
}
