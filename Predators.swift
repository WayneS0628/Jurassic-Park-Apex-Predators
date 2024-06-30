//
//  Predators.swift
//  JPApexPredators17
//
//  Created by Wayne Simmons Jr on 6/30/24.
//

import Foundation

class Predators { // class of predators because the predators and/or source of predator data may change over time
    var apexPredators: [ApexPredator] = [] // when data is decoded it needs a place to be stored, this will be that place
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() { // function to decode JSON file data
        // we access the file through a URL, apple calls the URL thats points to our main project folder the "main bundle URL"
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") { // 'if let' creates a new property using let and sets the property to the stuff we want if it works. In our case if the path exists the variable url is set to the files url. If we mistyped then our app wouldnt crash which is a little better
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
