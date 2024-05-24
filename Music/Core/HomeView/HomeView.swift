//
//  HomeView.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.secondBackground, Color.background]), startPoint: .top, endPoint: .bottom)
            VStack {
                HeaderView()
                Spacer()
                FooterView()
            }
        }
    }
}

#Preview {
    HomeView()
}
