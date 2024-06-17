//
//  DownloadImageManager.swift
//  Music
//
//  Created by Artem Somar on 15.06.2024.
//

import Foundation
import SwiftUI

class ImageLoader {
    
    static func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                return nil
            }
        return image
    }
    
    
    static func downloadImage(url: String) async throws -> UIImage? {
        guard let url = URL(string: url) else { return nil }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return handleResponse(data: data, response: response)
        } catch {
            throw error
        }
    }
    
}
