//
//  ApexPredator.swift
//  JPApexPredators17
//
//  Created by Wayne Simmons Jr on 6/23/24.
//

import Foundation // Import the Foundation framework, which provides essential data types and utilities
import SwiftUI

// Define a struct called 'ApexPredator' that conforms to the 'Decodable' protocol
// This struct represents the data structure for an apex predator in the JSON
// 'Decodable' allows the struct to be initialized from JSON data
struct ApexPredator: Decodable, Identifiable {
    let id: Int // Property to store the ID of the apex predator
    let name: String // Property to store the name of the apex predator
    let type: PredatorType // Property to store the type (e.g., land, sea) of the apex predator
    let latitude: Double // Property to store the latitude coordinate of the apex predator's location
    let longitude: Double // Property to store the longitude coordinate of the apex predator's location
    let movies: [String] // Property to store a list of movies featuring the apex predator
    let movieScenes: [MovieScene] // Property to store a list of movie scenes featuring the apex predator
    let link: String // Property to store a URL link with more information about the apex predator
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    // Define a nested struct called 'MovieScene' that also conforms to the 'Decodable' protocol
    // This struct represents the data structure for a movie scene in the JSON
    // 'Decodable' allows the struct to be initialized from JSON data
    struct MovieScene: Decodable, Identifiable {
        let id: Int // Property to store the ID of the movie scene
        let movie: String // Property to store the name of the movie
        let sceneDescription: String // Property to store the description of the scene
    }
    
    
}

enum PredatorType: String, Decodable, CaseIterable, Identifiable{
    var id: PredatorType {
        self
    }
    
    case all
    case land
    case air
    case sea
    
    
    var background: Color {
        switch self {
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        case .all:
                .black
        }
    }
    
    var icon: String {
        switch self {
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        case .all:
            "square.stack.3d.up.fill"
        }
    }
}
