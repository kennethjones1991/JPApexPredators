//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import Foundation

struct ApexPredator: Codable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
}

struct MovieScene: Codable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
