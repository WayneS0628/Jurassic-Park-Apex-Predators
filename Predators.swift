//
//  Predators.swift
//  JPApexPredators17
//
//  Created by Wayne Simmons Jr on 6/30/24.
//

import Foundation

class Predators { // class of predators because the predators and/or source of predator data may change over time
    var apexPredators: [ApexPredator] = [] // when data is decoded it needs a place to be stored, this will be that place
    var allApexPredators: [ApexPredator] = []
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
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchText: String) -> [ApexPredator]{
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter {
                predator in predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort{ predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else{
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: PredatorType) {
        if type == .all{
            apexPredators = allApexPredators
        }else {
            apexPredators = allApexPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
