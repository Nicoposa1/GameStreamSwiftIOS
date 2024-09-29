//
//  RickAndMortyModel.swift
//  GameStream
//
//  Created by Nicolas Posa on 25/09/2024.
//
import Foundation

// Top-level structure for the response
struct RickAndMortyResponse: Codable {
    var info: Info
    var results: [Character]
}

// Info structure that contains pagination details
struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

// Character structure to represent each character in the results
struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

// Origin structure for the origin of the character
struct Origin: Codable {
    var name: String
    var url: String
}

// Location structure for the current location of the character
struct Location: Codable {
    var name: String
    var url: String
}