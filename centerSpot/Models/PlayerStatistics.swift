//
//  PlayerStatistics.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct PlayerStatistics: Codable {
    let team: Team?
    let league: League?
    let game: GameData?
    let substitutes: SubstitutionData?
    let shots: Shots?
    let goals: Goals?
    let passes: Passes?
    let tackles: Tackles?
    let dribbles: Dribbles?
    let fouls: Fouls?
    let cards: Cards?
    let penalties: Penalty?
    
    enum CodingKeys: String, CodingKey {
        case team
        case league
        case game = "games"
        case substitutes
        case shots
        case goals
        case passes
        case tackles
        case dribbles
        case fouls
        case cards
        case penalties
    }
}
