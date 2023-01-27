//
//  PredatorController.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import Foundation

class PredatorController {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func sortByAlphabetical() {
        apexPredators.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovieAppearance() {
        apexPredators.sort(by: { $0.id < $1.id })
    }
}
