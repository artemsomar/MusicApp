//
//  TokenManager.swift
//  Music
//
//  Created by Artem Somar on 04.06.2024.
//

import Foundation

class TokenManager {
    
    static let userDefaultsManager = UserDefaultsManager.shared
    
    static func getSpotifyAccessToken(authorizationCode: String, clientID: String, clientSecret: String, redirectURI: String, tokenURL: String) async throws -> (accessToken: String, refreshToken: String) {
        
        let tokenURL = URL(string: tokenURL)!
        
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
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
            let accessToken = json["access_token"] as? String,
            let refreshToken = json["refresh_token"] as? String {
            
            userDefaultsManager.saveAccessToken(accessToken)
            userDefaultsManager.saveRefreshToken(refreshToken)
            
            return (accessToken, refreshToken)
        } else {
            throw URLError(.cannotParseResponse)
        }
    }
    
    static func refreshSpotifyAccessToken(refreshToken: String, clientID: String, clientSecret: String, tokenURL: String) async throws -> String {
        
        let tokenURL = URL(string: tokenURL)!
        
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        
        let bodyParams = [
            "grant_type": "refresh_token",
            "refresh_token": refreshToken,
            "client_id": clientID,
            "client_secret": clientSecret
        ]
        
        request.httpBody = bodyParams
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let accessToken = json["access_token"] as? String {
            
            userDefaultsManager.saveAccessToken(accessToken)
            
            return accessToken
        } else {
            throw URLError(.cannotParseResponse)
        }
    }
    
    static func loadTokens() -> (accessToken: String?, refreshToken: String?) {
        let accessToken = userDefaultsManager.getAccessToken()
        let refreshToken = userDefaultsManager.getRefreshToken()
        return (accessToken, refreshToken)
    }
    
    static func clearTokens() {

        userDefaultsManager.deleteAccessToken()
        userDefaultsManager.deleteRefreshToken()
    }
}



