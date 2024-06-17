//
//  NetworkingManager.swift
//  Music
//
//  Created by Artem Somar on 28.05.2024.
//

import Foundation

class NetworkingManager {
    
    static func download(url: URL, token: String) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Встановлення методу запиту
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization") 

        let (data, response) = try await URLSession.shared.data(for: request)

        try handleURLResponse(response: response)

        return data
    }
    
    static func handleURLResponse(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
    }
    
}
