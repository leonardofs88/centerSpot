//
//  MatchModel.swift
//  centerSpot
//
//  Created by Leonardo Soares on 06/10/2025.
//

import Foundation

struct MatchModel: Codable {
    let playerID: UUID?
    let league: String?
    let season: String?
    let team: String?
    let kickOff: Date?
    let number: Int?
    let position: String?
    let videoUrl: String?
}
