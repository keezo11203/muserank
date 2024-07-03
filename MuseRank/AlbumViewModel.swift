//
//  AlbumViewModel.swift
//  MuseRank
//
//  Created by Kaitlyn Ellis on 7/2/24.
//

import Foundation
import SwiftUI

class AlbumViewModel: ObservableObject {
    @Published var albums: [Album] = [
        Album(title: "HIT ME HARD AND SOFT", artist: "Artist 1", coverImage: "cover1", rating: nil, review: ""),
        Album(title: "eternal sunshine", artist: "Artist 2", coverImage: "cover2", rating: nil, review: ""),
        Album(title: "COWBOY CARTER", artist: "Artist 3", coverImage: "cover3", rating: nil, review: ""),
        Album(title: "brat", artist: "Artist 4", coverImage: "cover4", rating: nil, review: ""),
        Album(title: "TYLA", artist: "Artist 5", coverImage: "cover5", rating: nil, review: ""),
        Album(title: "MEGAN", artist: "Artist 6", coverImage: "cover6", rating: nil, review: ""),
        Album(title: "BB/ANG3L", artist: "Artist 7", coverImage: "cover7", rating: nil, review: ""),
        Album(title: "Radical Optimism", artist: "Artist 8", coverImage: "cover8", rating: nil, review: ""),
        Album(title: "The Rise and Fall of a Midwest Princess", artist: "Artist 9", coverImage: "cover9", rating: nil, review: ""),
        Album(title: "THINK LATER", artist: "Artist 10", coverImage: "cover10", rating: nil, review: ""),


    ]
    @Published var searchText: String = ""
    
    var filteredAlbums: [Album] {
        if searchText.isEmpty {
            return albums
        } else {
            return albums.filter { $0.title.contains(searchText) || $0.artist.contains(searchText) }
        }
    }
}
