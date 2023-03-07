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
}

struct MovieScene: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}

enum PredatorType: String, Decodable, CaseIterable {
    case all
    case land
    case air
    case sea
    
    var icon: String {
        switch self {
        case .all: return "square.stack.3d.up.fill"
        case .land: return "leaf.fill"
        case .air: return "wind"
        case .sea: return "drop.fill"
        }
    }
    
    var overlay: Color {
        switch self {
        case .land: return .brown
        case .air: return .teal
        case .sea: return .blue
        default: return .brown
        }
    }
}
