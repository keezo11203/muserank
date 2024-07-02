//
//  AlbumDetailView.swift
//  MuseRank
//
//  Created by Kaitlyn Ellis on 7/2/24.
//

import Foundation
import SwiftUI

struct AlbumDetailView: View {
    var album: Album

    var body: some View {
        VStack {
            Image(album.coverImage)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(10)
                .padding()
            Text(album.title)
                .font(.largeTitle)
                .padding(.top)
            Text(album.artist)
                .font(.title)
                .foregroundColor(.secondary)
            Text("Rating: \(album.rating)/5")
                .font(.headline)
                .padding(.top)
            Spacer()
        }
        .navigationBarTitle(Text(album.title), displayMode: .inline)
    }
}
