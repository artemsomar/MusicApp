//
//  QuickPicksViewModel.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import Foundation
import SwiftUI

class QuickPicksViewModel: ObservableObject {
    
    @Published var currentId: Int = 0
    @Published var offset: CGSize = .zero
    @Published var songsList: SongsList?
    
    var apiService: SpotifyApiService
    
    var sections: [[Track]] = []
    
    init(apiService: SpotifyApiService) {
        self.apiService = apiService
    }
    
    func fetchSongs() async {
        let fetchedSongsList = await apiService.fetchQuickPicsSongs()
        await MainActor.run {
            songsList = fetchedSongsList
            let songsArray = transormSongsToArray()
            divideToSections(songsArray: songsArray)
        }
        
    }
    
    private func transormSongsToArray() -> [Track] {
        guard let songsList = songsList else { return []}
        return songsList.tracks
    }
    
    private func divideToSections(songsArray: [Track]) {
        var sectionSongs: [Track] = []
        for index in 0..<songsArray.count {
            
            if index != 0 && index % 4 == 0 {
                sections.append(sectionSongs)
                sectionSongs = []
            }
            sectionSongs.append(songsArray[index])
        }
    }
    
    func onChangeDragGesture(value: DragGesture.Value) {
        withAnimation(.spring) {
            if currentId == 0 && value.translation.width > 0 {
                offset.width = 0
            } else if currentId == sections.count - 1 && value.translation.width < 0 {
                offset.width = 0
            } else {
                offset.width = value.translation.width
            }
        }
    }
    
    func onEndedDragGesture(proxy: ScrollViewProxy, value: DragGesture.Value) {
        if currentId != 0  {
            if value.translation.width > 50 {
                withAnimation(.easeOut) {
                    proxy.scrollTo(currentId - 1, anchor: .leading)
                    currentId -= 1
                }
            } else {
                withAnimation(.easeOut) {
                    offset.width = 0
                }
            }
        }
        if currentId != sections.count - 1 {
            if value.translation.width < -50 {
                withAnimation(.easeOut) {
                    proxy.scrollTo(currentId + 1, anchor: .leading)
                    currentId += 1
                    offset.width = 0
                }
            } else {
                withAnimation(.easeOut) {
                    offset.width = 0
                }
            }
        }
    }
}
