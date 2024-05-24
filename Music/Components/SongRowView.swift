//
//  SongRowView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct SongRowView: View {
    
    var songName: String
    var bandName: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.secondaryText)
                .frame(width: 65, height: 65)
                .padding(.trailing, 6)
            
            VStack (alignment: .leading) {
                Text(songName)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundStyle(Color.text)
                    .lineLimit(2)
                    
                
                Text(bandName)
                    .font(.callout)
                    .foregroundStyle(Color.secondaryText)
                    .lineLimit(1)
            }
            
            Spacer(minLength: 30)
            
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(-90))
                .font(.title)
                .foregroundStyle(Color.text)
                
        }
        
    }
}

#Preview {
    ZStack {
        Color.background
        
        SongRowView(songName: "RedAlert", bandName: "$uicideboy$")
            .padding(.horizontal, 10)
    }
    
}
