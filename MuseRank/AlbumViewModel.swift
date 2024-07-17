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
        Album(title: "HIT ME HARD AND SOFT", artist: "Billie Eilish", coverImage: "cover1", rating: nil, review: ""),
        Album(title: "eternal sunshine", artist: "Ariana Grande", coverImage: "cover2", rating: nil, review: ""),
        Album(title: "COWBOY CARTER", artist: "Beyonce", coverImage: "cover3", rating: nil, review: ""),
        Album(title: "brat", artist: "Charli XCX", coverImage: "cover4", rating: nil, review: ""),
        Album(title: "TYLA", artist: "Tyla", coverImage: "cover5", rating: nil, review: ""),
        Album(title: "MEGAN", artist: "Megan Thee Stallion", coverImage: "cover6", rating: nil, review: ""),
        Album(title: "BB/ANG3L", artist: "Tinashe", coverImage: "cover7", rating: nil, review: ""),
        Album(title: "GUTS", artist: "Olivia Rodrigo", coverImage: "cover8", rating: nil, review: ""),
        Album(title: "The Rise and Fall of a Midwest Princess", artist: "Chappell Roan", coverImage: "cover9", rating: nil, review: ""),
        Album(title: "THINK LATER", artist: "Tate McRae", coverImage: "cover10", rating: nil, review: ""),


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
