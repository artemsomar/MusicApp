//
//  UserDefaultsManager.swift
//  Music
//
//  Created by Artem Somar on 13.06.2024.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    private let accessTokenKey = "spotify_access_token"
    private let refreshTokenKey = "spotify_refresh_token"
    
    private init() {}
    
    func saveAccessToken(_ token: String) {
        userDefaults.set(token, forKey: accessTokenKey)
    }
    
    func getAccessToken() -> String? {
        return userDefaults.string(forKey: accessTokenKey)
    }
    
    func deleteAccessToken() {
        userDefaults.removeObject(forKey: accessTokenKey)
    }

    func saveRefreshToken(_ token: String) {
        userDefaults.set(token, forKey: refreshTokenKey)
    }
    
    func getRefreshToken() -> String? {
        return userDefaults.string(forKey: refreshTokenKey)
    }
    
    func deleteRefreshToken() {
        userDefaults.removeObject(forKey: refreshTokenKey)
    }
    
    func clearTokens() {
        userDefaults.removeObject(forKey: accessTokenKey)
        userDefaults.removeObject(forKey: refreshTokenKey)
    }
}


