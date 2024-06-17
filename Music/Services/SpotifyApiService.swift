//
//  SpotifyApiService.swift
//  Music
//
//  Created by Artem Somar on 28.05.2024.
//

import SwiftUI
import Combine

//@MainActor
class SpotifyApiService: ObservableObject {
    
    private let clientID = "4ab986c323ee4ba6b93e0f8d2797adac"
    private let clientSecret = "8edd4fbf6a6041f2b087664458bf1bb2"
    private let redirectURI = "http://localhost:8000"
    
    var authorizationCode: String?
    private var accessToken: String?
    private var refreshToken: String?
    
    func fetchAllData() async {
        
    }
    
    func fetchUserData() async -> User? {
        guard
            let url = URL(string: "https://api.spotify.com/v1/me"),
            let token = accessToken
        else { return nil }
        
        do {
            let data = try await NetworkingManager.download(url: url, token: token)
            let returnedUser = try JSONDecoder().decode(User.self, from: data)
            
            return returnedUser
        } catch {
            print("Error fetching user data: \(error.localizedDescription)")
        }
        return nil
    }
    
    func fetchQuickPicsSongs() async -> SongsList? {
        
        var components = URLComponents(string: "https://api.spotify.com/v1/recommendations")!
        components.queryItems = [
            URLQueryItem(name: "seed_artists", value: "4NHQUGzhtTLFvgF5SZesLK"),
            URLQueryItem(name: "seed_genres", value: "classical%2Ccountry"),
            URLQueryItem(name: "seed_tracks", value: "0c6xIDDpzE81m2q797ordA")
        ]
        
        guard
            let url = components.url,
            let token = self.accessToken
        else { return nil }
        
        do {
            let data = try await NetworkingManager.download(url: url, token: token)
            
            let returnedList = try JSONDecoder().decode(SongsList.self, from: data)
            
            return returnedList
        } catch {
            print("Error fetching Quick Pics Songs: \(error) \(error.localizedDescription)")
        }
        
        return nil
    }
    
    func getAccessToken() async {
        guard let authorizationCode = authorizationCode else {
            return
        }
        do {
            let (accessToken, refreshToken) = try await TokenManager.getSpotifyAccessToken(authorizationCode: authorizationCode, clientID: clientID, clientSecret: clientSecret, redirectURI: redirectURI, tokenURL: "https://accounts.spotify.com/api/token")
            self.accessToken = accessToken
            print(accessToken)
            self.refreshToken = refreshToken
        } catch {
            print("Error getting access token: \(error.localizedDescription)")
        }
    }
}

