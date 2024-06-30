//
//  ApexPredator.swift
//  JPApexPredators17
//
//  Created by Wayne Simmons Jr on 6/23/24.
//

import Foundation // Import the Foundation framework, which provides essential data types and utilities

// Define a struct called 'ApexPredator' that conforms to the 'Decodable' protocol
// This struct represents the data structure for an apex predator in the JSON
// 'Decodable' allows the struct to be initialized from JSON data
struct ApexPredator: Decodable {
    let id: Int // Property to store the ID of the apex predator
    let name: String // Property to store the name of the apex predator
    let type: String // Property to store the type (e.g., land, sea) of the apex predator
    let latitude: Double // Property to store the latitude coordinate of the apex predator's location
    let longitude: Double // Property to store the longitude coordinate of the apex predator's location
    let movies: [String] // Property to store a list of movies featuring the apex predator
    let movieScenes: [MovieScene] // Property to store a list of movie scenes featuring the apex predator
    let link: String // Property to store a URL link with more information about the apex predator
    
    // Define a nested struct called 'MovieScene' that also conforms to the 'Decodable' protocol
    // This struct represents the data structure for a movie scene in the JSON
    // 'Decodable' allows the struct to be initialized from JSON data
    struct MovieScene: Decodable {
        let id: Int // Property to store the ID of the movie scene
        let movie: String // Property to store the name of the movie
        let sceneDescription: String // Property to store the description of the scene
    }
}
