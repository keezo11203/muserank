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
            VStack {
                SearchBar(text: $viewModel.searchText)
                List(viewModel.filteredAlbums) { album in
                    NavigationLink(destination: AlbumDetailView(album: album, viewModel: viewModel)) {
                        AlbumRow(album: album)
                    }
                }
                .navigationBarTitle("MuseRank: Review Your Favorite Albums")
            }
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
            if let rating = album.rating {
                Text("\(rating)/5")
                    .font(.subheadline)
            } else {
                Text("No Rating")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
