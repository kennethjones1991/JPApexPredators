//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable { // TODO: change Codable to Decodable
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        switch type {
        case "land": return .brown
        case "air": return .teal
        case "sea": return .blue
        default: return .brown
        }
    }
}

struct MovieScene: Codable, Identifiable { // TODO: change Codable to Decodable
    let id: Int
    let movie: String
    let sceneDescription: String
}
