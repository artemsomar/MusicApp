//
//  PreviewManager.swift
//  Music
//
//  Created by Artem Somar on 16.06.2024.
//

import Foundation
import SwiftUI

class PreviewManager {
    
    static func getDefaultTrack() -> Track {
        return Track(
            
            album: Album(
                albumType: AlbumType(rawValue: "ALBUM")!,
                artists: [
                    Artist(
                        externalUrls: ExternalUrls(spotify: "https://open.spotify.com/artist/163tK9Wjr9P9DmM0AVK7lm"),
                        href: "https://api.spotify.com/v1/artists/163tK9Wjr9P9DmM0AVK7lm",
                        id: "163tK9Wjr9P9DmM0AVK7lm",
                        name: "Lorde",
                        type: ArtistType(rawValue: "artist")!,
                        uri: "spotify:artist:163tK9Wjr9P9DmM0AVK7lm"
                    )
                ],
                availableMarkets: [
                    "AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE",
                    "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU",
                    "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES",
                    "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL",
                    "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "KZ",
                    "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG",
                    "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "CV", "CW", "DM", "FJ", "GM", "GE", "GD",
                    "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW",
                    "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV",
                    "VU", "AZ", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN",
                    "RW", "TG", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ",
                    "VE", "ET", "XK"
                ],
                externalUrls: ExternalUrls(spotify: "https://open.spotify.com/album/2B87zXm9bOWvAJdkJBTpzF"),
                href: "https://api.spotify.com/v1/albums/2B87zXm9bOWvAJdkJBTpzF",
                id: "2B87zXm9bOWvAJdkJBTpzF",
                images: [
                    ImageSpotify(url: "https://i.scdn.co/image/ab67616d0000b273f8553e18a11209d4becd0336", height: 640, width: 640),
                    ImageSpotify(url: "https://i.scdn.co/image/ab67616d00001e02f8553e18a11209d4becd0336", height: 300, width: 300),
                    ImageSpotify(url: "https://i.scdn.co/image/ab67616d00004851f8553e18a11209d4becd0336", height: 64, width: 64)
                ],
                name: "Melodrama",
                releaseDate: "2017-06-16",
                releaseDatePrecision: ReleaseDatePrecision(rawValue: "day")!,
                totalTracks: 11,
                type: AlbumTypeEnum(rawValue: "album")!,
                uri: "spotify:album:2B87zXm9bOWvAJdkJBTpzF"
            ),
            artists: [
                Artist(
                    externalUrls: ExternalUrls(spotify: "https://open.spotify.com/artist/163tK9Wjr9P9DmM0AVK7lm"),
                    href: "https://api.spotify.com/v1/artists/163tK9Wjr9P9DmM0AVK7lm",
                    id: "163tK9Wjr9P9DmM0AVK7lm",
                    name: "Lorde",
                    type: ArtistType(rawValue: "artist")!,
                    uri: "spotify:artist:163tK9Wjr9P9DmM0AVK7lm"
                )
            ],
            availableMarkets: [
                "AR", "AU", "AT", "BE", "BO", "BR", "BG", "CA", "CL", "CO", "CR", "CY", "CZ", "DK", "DO", "DE",
                "EC", "EE", "SV", "FI", "FR", "GR", "GT", "HN", "HK", "HU", "IS", "IE", "IT", "LV", "LT", "LU",
                "MY", "MT", "MX", "NL", "NZ", "NI", "NO", "PA", "PY", "PE", "PH", "PL", "PT", "SG", "SK", "ES",
                "SE", "CH", "TW", "TR", "UY", "US", "GB", "AD", "LI", "MC", "ID", "JP", "TH", "VN", "RO", "IL",
                "ZA", "SA", "AE", "BH", "QA", "OM", "KW", "EG", "MA", "DZ", "TN", "LB", "JO", "PS", "IN", "KZ",
                "MD", "UA", "AL", "BA", "HR", "ME", "MK", "RS", "SI", "KR", "BD", "PK", "LK", "GH", "KE", "NG",
                "TZ", "UG", "AG", "AM", "BS", "BB", "BZ", "BT", "BW", "CV", "CW", "DM", "FJ", "GM", "GE", "GD",
                "GW", "GY", "HT", "JM", "KI", "LS", "LR", "MW", "MV", "ML", "MH", "FM", "NA", "NR", "NE", "PW",
                "PG", "WS", "SM", "ST", "SN", "SC", "SL", "SB", "KN", "LC", "VC", "SR", "TL", "TO", "TT", "TV",
                "VU", "AZ", "BI", "KH", "CM", "TD", "KM", "GQ", "SZ", "GA", "GN", "KG", "LA", "MO", "MR", "MN",
                "RW", "TG", "ZW", "BJ", "MG", "MU", "MZ", "AO", "CI", "DJ", "ZM", "CD", "CG", "IQ", "LY", "TJ",
                "VE", "ET", "XK"
            ],
            discNumber: 1,
            durationMS: 277506,
            explicit: false,
            externalIDS: ExternalIDS(isrc: "NZUM71700072"),
            externalUrls: ExternalUrls(spotify: "https://open.spotify.com/track/6K8VQ84MqhsoakN5MjrnVR"),
            href: "https://api.spotify.com/v1/tracks/6K8VQ84MqhsoakN5MjrnVR",
            id: "6K8VQ84MqhsoakN5MjrnVR",
            isLocal: false,
            name: "Supercut",
            popularity: 69,
            previewURL: nil,
            trackNumber: 9,
            type: TrackType(rawValue: "track")!,
            uri: "spotify:track:6K8VQ84MqhsoakN5MjrnVR"

        )
    }
}
