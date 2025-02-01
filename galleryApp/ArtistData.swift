//
//  ArtistModel.swift
//  galleryApp
//
//  Created by Anna Melekhina on 28.01.2025.
//

import Foundation

struct ArtistData: Decodable {
 var artists: [Artist]
}

struct Artist: Decodable {
    var name: String
    var bio: String
    var image: String
    var works: [Work]
}

struct Work: Decodable {
var title: String
var image: String
var info: String
}
