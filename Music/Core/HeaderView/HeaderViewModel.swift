//
//  HeaderViewModel.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import Foundation
import SwiftUI
import Combine

class HeaderViewModel: ObservableObject {
    
    @EnvironmentObject var apiService: SpotifyApiService
    
    @Published var showAuthorization = false
    @Published var showWebView = false
    @Published var user: User? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    
    
}
