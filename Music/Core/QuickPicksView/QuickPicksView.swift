//
//  QuickPicsView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct QuickPicksView: View {
    
    @StateObject var vm: QuickPicksViewModel
    @State var currentId: Int = 0
    @State var offset: CGSize = .zero
    @State var demonstrationSong: Song = Song(songName: "error", bandName: "error")
    
    @Binding var isPlayerView: Bool
    
    var body: some View {
        VStack {
//            Text("\(offset.width)")
//                .font(.title)
//                .foregroundStyle(Color.text)
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
                    .offset(offset)
                }
                
                .scrollDisabled(true)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring) {
                                if currentId == 0 && value.translation.width > 0 {
                                    offset.width = 0
                                } else if currentId == vm.sections.count - 1 && value.translation.width < 0 {
                                    offset.width = 0
                                } else {
                                    offset.width = value.translation.width
                                }
                            }
                        })
                        .onEnded({ value in
                            
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
                            if currentId != vm.sections.count - 1 {
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
                        })
                )
            }
            HStack(spacing: 20) {
                ForEach(0..<vm.sections.count, id: \.self) { index in
                    Capsule()
                        .fill(index == currentId ? Color.text : Color.secondaryText)
                        .frame(width: 32, height: 3)
                        
                }
            }
            .padding(.top, 12)
        }
        .padding(.horizontal)
    }
}

#Preview {

    ZStack {
        Color.background

        QuickPicksView(vm: QuickPicksViewModel(), isPlayerView: .constant(false))
    }
}
