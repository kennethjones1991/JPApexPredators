//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Kenneth Jones on 1/26/23.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().filter { $0 != " " }
    }
    
    func typeOverlay() -> Color {
        switch type {
        case .land: return .brown
        case .air: return .teal
        case .sea: return .blue
        default: return .brown
        }
    }
}

struct MovieScene: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}

enum PredatorType: String, Codable, CaseIterable {
    case all = "all"
    case land = "land"
    case air = "air"
    case sea = "sea"
    
    var icon: String {
        switch self {
        case .all: return "square.stack.3d.up.fill"
        case .land: return "leaf.fill"
        case .air: return "wind"
        case .sea: return "drop.fill"
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeString = try container.decode(String.self)
        
        if let type = PredatorType(rawValue: typeString) {
            self = type
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to initialize AllType from string type: \(typeString)")
        }
    }
}
