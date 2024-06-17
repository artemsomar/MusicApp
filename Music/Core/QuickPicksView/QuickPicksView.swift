//
//  QuickPicsView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct QuickPicksView: View {
    
    @EnvironmentObject var apiService: SpotifyApiService
    @StateObject var vm: QuickPicksViewModel
    
    @State var demonstrationSong: Track? = nil
    
    @Binding var isPlayerView: Bool
    
    init(apiService: SpotifyApiService, isPlayerView: Binding<Bool>) {
        _vm = StateObject(wrappedValue: QuickPicksViewModel(apiService: apiService))
        self._isPlayerView = isPlayerView
    }
    
    var body: some View {
        VStack {

            Text("Start radio based on a song")
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.secondaryText)
                .font(.footnote)
            
            HStack {
                Text("Quick picks")
                    .font(.title)
                    .foregroundStyle(Color.text)
                    .fontWeight(.bold)
                Spacer()
                CircledButton(text: "Play all")
            }
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack (spacing: 20){
                        ForEach(0..<vm.sections.count, id: \.self) { index in
                            SectionView(demonstrationSong: $demonstrationSong, sectionSongs: vm.sections[index], isPlayerView: $isPlayerView)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .id(index)
                        }
                    }
                    .offset(vm.offset)
                }
                
                .scrollDisabled(true)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            vm.onChangeDragGesture(value: value)
                        })
                        .onEnded({ value in
                            vm.onEndedDragGesture(proxy: proxy, value: value)
                        })
                )
            }
            HStack(spacing: 20) {
                ForEach(0..<vm.sections.count, id: \.self) { index in
                    Capsule()
                        .fill(index == vm.currentId ? Color.text : Color.secondaryText)
                        .frame(width: 32, height: 3)
                        
                }
            }
            .padding(.top, 12)
        }
        .padding(.horizontal)
        .task {
            await apiService.getAccessToken()
            await vm.fetchSongs()
        }
    }
}

