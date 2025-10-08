//
//  Shots.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct Shots: Codable {
    let total: Int?
    let onValue: Int?
    
    enum CodingKeys: String, CodingKey {
        case total
        case onValue = "on"
    }
}
