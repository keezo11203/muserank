//
//  ContentView.swift
//  MuseRank
//
//  Created by Kaitlyn Ellis on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AlbumViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.albums) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    AlbumRow(album: album)
                }
            }
            .navigationBarTitle("Music List")
        }
    }
}

struct AlbumRow: View {
    var album: Album

    var body: some View {
        HStack {
            Image(album.coverImage)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(album.title)
                    .font(.headline)
                Text(album.artist)
                    .font(.subheadline)
            }
            Spacer()
            Text("\(album.rating)/5")
                .font(.subheadline)
        }
    }
}
