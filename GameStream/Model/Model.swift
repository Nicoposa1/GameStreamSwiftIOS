//
//  Model.swift
//  GameStream
//
//  Created by Nicolas Posa on 25/09/2024.
//

import Foundation

struct Games:Codable {
    var games:[Game]
    
}

struct Game:Codable {
    var title:String
    var Studio:String
    var contentRating:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
}

struct videoUrl:Codable {
    var mobile:String
    var tablet:String
}
