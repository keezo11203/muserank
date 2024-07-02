//
//  AlbumDetailView.swift
//  MuseRank
//
//  Created by Kaitlyn Ellis on 7/2/24.
//

import Foundation
import SwiftUI

struct AlbumDetailView: View {
    @State var album: Album
    @ObservedObject var viewModel: AlbumViewModel

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
            HStack {
                Text("Rating: \(album.rating)/5")
                Stepper("", value: $album.rating, in: 1...5)
                    .labelsHidden()
            }
            .font(.headline)
            .padding(.top)
            TextField("Review", text: $album.review)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
        }
        .navigationBarTitle(Text(album.title), displayMode: .inline)
        .onDisappear {
            if let index = viewModel.albums.firstIndex(where: { $0.id == album.id }) {
                viewModel.albums[index] = album
            }
        }
    }
}
