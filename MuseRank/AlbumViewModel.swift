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
        Album(title: "Album 1", artist: "Artist 1", coverImage: "cover1", rating: 4, review: ""),
        Album(title: "Album 2", artist: "Artist 2", coverImage: "cover2", rating: 5, review: ""),
        Album(title: "Album 3", artist: "Artist 3", coverImage: "cover3", rating: 3, review: "")
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
