//
//  Albums.swift
//  MuseRank
//
//  Created by Kaitlyn Ellis on 7/2/24.
//

import Foundation
import SwiftUI

struct Album: Identifiable {
    var id = UUID()
    var title: String
    var artist: String
    var coverImage: String
    var rating: Int?
    var review: String
}

