//
//  PlayerView.swift
//  Music
//
//  Created by Artem Somar on 25.05.2024.
//

import SwiftUI

struct PlayerView: View {
    
    var song: Song
    @State var sliderValue: Double = 0.5
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.secondBackground, Color.background]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .foregroundColor(Color.text)
                    
                    Spacer()
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(-90))
                        .font(.title2)
                        .foregroundStyle(Color.text)
                    
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
                .padding(.top, 10)
                
                Rectangle()
                    .fill(Color.secondaryText)
                    .cornerRadius(18)
                    .frame(width: UIScreen.main.bounds.width - 72 < 400 ? UIScreen.main.bounds.width - 72 : 400, height: UIScreen.main.bounds.width - 72 < 400 ? UIScreen.main.bounds.width - 72 : 400)
                
                
                
                Text("\(song.songName)")
                    .font(.title)
                    .foregroundStyle(Color.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .fontWeight(.bold)
                
                Text("\(song.bandName)")
                    .font(.title3)
                    .foregroundStyle(Color.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .fontWeight(.semibold)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 12) {
                        HStack {
                            Image(systemName: "hand.thumbsup")
                                .padding(.horizontal, 8)
                            
                            Rectangle()
                                .fill(Color.secondaryText)
                                .frame(width: 2, height: 20)
                                
                            Image(systemName: "hand.thumbsdown")
                                .padding(.horizontal, 8)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .foregroundColor(Color.text)
                        
                        Image(systemName: "text.bubble")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .foregroundColor(Color.text)
                        
                        HStack {
                            Image(systemName: "rectangle.stack.badge.plus")
                                .font(.footnote)
                            Text("Save")
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .foregroundColor(Color.text)
                        
                        HStack {
                            Image(systemName: "arrowshape.turn.up.forward")
//                                .font(.footnote)
                            Text("Share")
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .foregroundColor(Color.text)
                        
                        HStack {
                            Image(systemName: "arrow.down")
                            Text("Download")
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .foregroundColor(Color.text)
                        
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical)
                
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
                
                HStack {
                    Spacer()
                    Image(systemName: "shuffle")
                        .font(.title)
                    
                    Spacer()
                    Image(systemName: "backward.end")
                        .font(.title)
                    
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    Spacer()
                    Image(systemName: "forward.end")
                        .font(.title)
                    
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.title)
                    Spacer()
                }
                .foregroundColor(Color.text)
                
                Spacer()
                
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
                .font(.callout)
                .foregroundColor(Color.text)
            }
        }
    }
}

#Preview {
    PlayerView(song: Song(songName: "...And so It Was", bandName: "$uicideboy$"))
}
