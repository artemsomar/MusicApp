//
//  SpotifyAuthView.swift
//  Music
//
//  Created by Artem Somar on 29.05.2024.
//

import SwiftUI
import WebKit

struct SpotifyAuthView: UIViewRepresentable {
    
    @EnvironmentObject var apiService: SpotifyApiService
    
    @Binding var showWebView: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
        
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        var components = URLComponents(string: "https://accounts.spotify.com/authorize")!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "4ab986c323ee4ba6b93e0f8d2797adac"),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "redirect_uri", value: "http://localhost:8000"),
            URLQueryItem(name: "scope", value: "user-read-private user-read-email playlist-read-private user-library-read user-library-modify user-follow-read user-follow-modify user-modify-playback-state user-read-playback-state ugc-image-upload user-top-read user-top-read user-read-playback-position"),
            URLQueryItem(name: "show_dialog", value: "false")
        ]
        
        guard let authURL = components.url else {
            fatalError("Invalid URL components for Spotify authorization")
        }
        
        webView.load(URLRequest(url: authURL))
        
        return webView
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {}
        
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: SpotifyAuthView
        
        init(_ parent: SpotifyAuthView) {
            self.parent = parent
            
        }
        
        @MainActor func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url, url.absoluteString.starts(with: "http://localhost:8000") {
                if let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code" })?.value {
                    parent.apiService.authorizationCode = code
                    parent.showWebView = false
                    
                }
            }
            decisionHandler(.allow)
        }
        
    }
}
//
//#Preview {
//    SpotifyAuthView(showWebView: .constant(true))
//}

