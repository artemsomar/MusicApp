//
//  SongRowViewModel.swift
//  Music
//
//  Created by Artem Somar on 15.06.2024.
//

import Foundation
import SwiftUI

class SongRowViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func fetchImage() async {
        let image = try? await ImageLoader.downloadImage(url: url)
        await MainActor.run {
            self.image = image
        }
        
    }
    
}
