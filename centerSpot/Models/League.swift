//
//  League.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct League: Codable, Identifiable {
    let id: Int?
    let name: String?
    let country: String?
    let logo: String?
    let flag: String?
    let season: Int?
    
    var logoURL: URL? {
        guard let logo else { return nil }
        return URL(string: logo)
    }
    
    var flagURL: URL? {
        guard let flag else { return nil }
        return URL(string: flag)
    }
}
