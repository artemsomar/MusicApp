//
//  PlayerView.swift
//  Music
//
//  Created by Artem Somar on 25.05.2024.
//

import SwiftUI

struct PlayerView: View {
    
    @Binding var song: Track?
    @State var sliderValue: Double = 0.5
    @Binding var isPlayerView: Bool
    
    @StateObject var viewModel: PlayerViewModel
    
    init(song: Binding<Track?>, isPlayerView: Binding<Bool>) {
        self._song = song
        self._isPlayerView = isPlayerView
        _viewModel = StateObject(wrappedValue: PlayerViewModel(url: song.wrappedValue?.album.images[0].url ?? ""))
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.secondBackground, Color.background]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .foregroundColor(Color.text)
                        .onTapGesture {
                            isPlayerView = false
                        }
                    
                    Spacer()
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(-90))
                        .font(.title2)
                        .foregroundStyle(Color.text)
                    
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
                .padding(.top, 10)
                
                ZStack {
                    if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(18)
                            .frame(width: UIScreen.main.bounds.width - 54 < 400 ? UIScreen.main.bounds.width - 54 : 400, height: UIScreen.main.bounds.width - 54 < 400 ? UIScreen.main.bounds.width - 54 : 400)
                        
                    } else {
                        Rectangle()
                            .fill(Color.secondaryText)
                            .cornerRadius(18)
                            .frame(width: UIScreen.main.bounds.width - 72 < 400 ? UIScreen.main.bounds.width - 72 : 400, height: UIScreen.main.bounds.width - 72 < 400 ? UIScreen.main.bounds.width - 72 : 400)
                    }
                }
                .task {
                    await viewModel.fetchImage()
                }
                
                
                songNameView
                
                likesScrollMenuView
                
                sliderView
                
                playerInteractionView
                
                
                Spacer()
                
                footerView
            }
        }
    }
}

#Preview {
    PlayerView(song: .constant(PreviewManager.getDefaultTrack()), isPlayerView: .constant(true))
}

extension PlayerView {
    
    var songNameView: some View {
        VStack (spacing: 8) {
            Text(song?.name ?? "error")
                .font(.title2)
                .foregroundStyle(Color.text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .fontWeight(.bold)
                .lineLimit(1)
            
            Text(song?.artists.map { "\($0.name)" }.joined(separator: " & ") ?? "error")
                .font(.headline)
                .foregroundStyle(Color.secondaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
    }
    
    var likesScrollMenuView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 12) {
                HStack {
                    Image(systemName: "hand.thumbsup")
                        .padding(.horizontal, 8)
                        .font(.callout)
                    
                    Rectangle()
                        .fill(Color.secondaryText)
                        .frame(width: 2, height: 16)
                        
                    Image(systemName: "hand.thumbsdown")
                        .padding(.horizontal, 8)
                        .font(.callout)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .foregroundColor(Color.text)

                
                HStack {
                    Image(systemName: "rectangle.stack.badge.plus")
                        .font(.footnote)
                    Text("Save")
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .foregroundColor(Color.text)
                .font(.callout)
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.forward")
//                                .font(.footnote)
                    Text("Share")
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .foregroundColor(Color.text)
                .font(.callout)
                
                HStack {
                    Image(systemName: "arrow.down")
                    Text("Download")
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .foregroundColor(Color.text)
                .font(.callout)
                
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical)
    }
    
    var sliderView: some View {
        VStack (spacing: 0) {
            Slider(value: $sliderValue)
                .accentColor(Color.text)
                
            HStack {
                Text("1:34")
                Spacer()
                Text("3:05")
            }
            .font(.caption)
            .foregroundColor(Color.text)
        }
        .padding(.horizontal, 24)
    }
    
    var playerInteractionView: some View {
            
            HStack {
                Spacer()
                Image(systemName: "shuffle")
                    .font(.title2)
                
                Spacer()
                Image(systemName: "backward.end")
                    .font(.title2)
                
                Spacer()
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Spacer()
                Image(systemName: "forward.end")
                    .font(.title2)
                
                Spacer()
                Image(systemName: "repeat")
                    .font(.title2)
                Spacer()
            }
            .foregroundColor(Color.text)
    }
    
    var footerView: some View {
        HStack {
            Spacer()
            Text("Up next")
            Spacer()
            Text("Lyrics")
            Spacer()
            Text("Related")
            Spacer()
        }
        .textCase(.uppercase)
        .font(.subheadline)
        .foregroundColor(Color.text)
        .fontWeight(.semibold)
    }
}
