//
//  GameData.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct GameData: Codable {
    let appearences: Int?
    let lineups: Int?
    let minutes: Int?
    let number: Int?
    let position: String?
    let rating: String?
    let captain: Bool?
    
    var ratingValue: Double? {
        guard let rating else { return nil }
        return Double(rating)
    }
}
