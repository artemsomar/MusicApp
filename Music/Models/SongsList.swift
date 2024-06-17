//
//  Song.swift
//  Music
//
//  Created by Artem Somar on 24.05.2024.
//

import Foundation

struct SongsList: Codable {
    let tracks: [Track]
    let seeds: [Seed]
}

struct Seed: Codable {
    let initialPoolSize, afterFilteringSize, afterRelinkingSize: Int
    let id, type: String
    let href: String?
}

struct Track: Codable {
    let album: Album
    let artists: [Artist]
    let availableMarkets: [String]
    let discNumber, durationMS: Int
    let explicit: Bool
    let externalIDS: ExternalIDS
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let isLocal: Bool
    let name: String
    let popularity: Int
    let previewURL: String?
    let trackNumber: Int
    let type: TrackType
    let uri: String

    enum CodingKeys: String, CodingKey {
        case album, artists
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMS = "duration_ms"
        case explicit
        case externalIDS = "external_ids"
        case externalUrls = "external_urls"
        case href, id
        case isLocal = "is_local"
        case name, popularity
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type, uri
    }
    
    
}

struct Album: Codable {
    let albumType: AlbumType
    let artists: [Artist]
    let availableMarkets: [String]
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [ImageSpotify]
    let name, releaseDate: String
    let releaseDatePrecision: ReleaseDatePrecision
    let totalTracks: Int
    let type: AlbumTypeEnum
    let uri: String

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case type, uri
    }
}

enum AlbumType: String, Codable {
    case album = "ALBUM"
    case compilation = "COMPILATION"
    case single = "SINGLE"
}

struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id, name: String
    let type: ArtistType
    let uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

enum ReleaseDatePrecision: String, Codable {
    case day = "day"
    case year = "year"
}

enum AlbumTypeEnum: String, Codable {
    case album = "album"
}

struct ExternalIDS: Codable {
    let isrc: String
}

enum TrackType: String, Codable {
    case track = "track"
}

struct ExternalUrls: Codable {
    let spotify: String
}

struct Followers: Codable {
    let href: String?
    let total: Int
}

struct ImageSpotify: Codable {
    let url: String
    let height, width: Int
}
