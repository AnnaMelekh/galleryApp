//
//  ArtistData.swift
//  galleryApp
//
//  Created by Anna Melekhina on 28.01.2025.
//

import Foundation

struct ArtistModel:Decodable {
    
    var name: String
    var bio: String
    var image: String
    var works: [Works]
}

struct Works: Decodable {
  var title: String
  var image: String
  var info: String
}
