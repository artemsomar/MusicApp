//
//  HeaderView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var apiService: SpotifyApiService
    @StateObject var vm = HeaderViewModel()
    
    var body: some View {
        ZStack {
            
            Color.secondBackground
                .ignoresSafeArea()
            
            HStack {
                Text("Music")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.text)
                    .padding(.leading, 24)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.text)
                    .font(.title)
                    .padding(.trailing, 8)
                
                Circle()
                    .fill(Color.secondaryText)
                    .frame(width: 30)
                    .padding(.horizontal, 8)
                    
            }
            
        }
        .frame(height: 50)
        
        
    }
}
//
//#Preview {
//    VStack {
//        HeaderView()
//        Spacer()
//    }
//}
