//
//  SongRowView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct SongRowView: View {
    
    var song: Track
    @StateObject var viewModel: SongRowViewModel
    
    init(song: Track) {
        self.song = song
        _viewModel = StateObject(wrappedValue: SongRowViewModel(url: song.album.images[0].url))
    }
    
    var body: some View {
        HStack {
            ZStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(5)
                        .padding(.trailing, 6)
                        
                        
                } else {
                    Rectangle()
                        .fill(Color.secondaryText)
                        .cornerRadius(5)
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 6)
                }
            }
            .task {
                await viewModel.fetchImage()
            }

            VStack (alignment: .leading) {
                Text(song.name)
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundStyle(Color.text)
                    .lineLimit(1)
                    
                
                Text(song.artists.map { "\($0.name)" }.joined(separator: " & "))
                    .font(.callout)
                    .foregroundStyle(Color.secondaryText)
                    .lineLimit(1)
            }
            
            Spacer(minLength: 30)
            
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(-90))
                .font(.title2)
                .foregroundStyle(Color.text)
                .padding(.trailing, 6)
                .onTapGesture {
                    
                }
        }
        
    }
}


