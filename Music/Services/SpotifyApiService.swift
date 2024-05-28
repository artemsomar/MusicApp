//
//  SpotifyApiService.swift
//  Music
//
//  Created by Artem Somar on 28.05.2024.
//

import Foundation
import Combine

class SpotifyApiService: ObservableObject {
    
    
    var subscription: AnyCancellable?
    
    init() {
        getSpotifyAccessToken(authorizationCode: "AQDmbZaj7wotA6YOPAPdbFHpTHUd1_6i12BXkfmb_Fquou1vr0vq9dv-4COjqCb3Wjnccu-jzmWEkNfP-G_7zP1dUqfQdSy3803EyEy8UcDA7bZcKTK-mruLyXq7r6xcFrSKx4FtKfx85VqpPWl-46MWGjP_e5x5hlFuIA5K8OZLK3okaqnb0co7jhhTLB6-KjKys-Nwo1AtAy4C9Q")
    }
    
    func getSpotifyAccessToken(authorizationCode: String) {
        let clientID = "d748de4ed133407f80d1bcb63e913393"
        let clientSecret = "e2c3cdd17001407da58e4fd21b6101ff"
        let redirectURI = "http://localhost:3000"
        
        let tokenURL = URL(string: "https://accounts.spotify.com/api/token")!
        
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        
        let bodyParams = [
            "grant_type": "authorization_code",
            "code": authorizationCode,
            "redirect_uri": redirectURI,
            "client_id": clientID,
            "client_secret": clientSecret
        ]
        
        request.httpBody = bodyParams
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "No data")")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let accessToken = json["access_token"] as? String {
                print("Access Token: \(accessToken)")
            } else {
                print("Failed to parse token")
            }
        }
        
        task.resume()
    }

    // Виклик функції з вашим кодом авторизації
    
    
}
