//
//  PredatorController.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import Foundation

class PredatorController {
    static let previewController = PredatorController()
    
    private var allApexPredators: [ApexPredator] = []
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
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func filterBy(type: PredatorType) {
        switch type {
        case .land, .air, .sea:
            apexPredators = allApexPredators.filter {
                $0.type == type
            }
        default: apexPredators = allApexPredators
        }
    }
    
    func sortByAlphabetical() {
        apexPredators.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovieAppearance() {
        apexPredators.sort(by: { $0.id < $1.id })
    }
}
