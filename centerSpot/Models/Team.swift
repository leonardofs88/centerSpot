//
//  Team.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct Team: Codable, Identifiable {
    let id: Int?
    let name: String?
    let logo: String?
    
    var logoURL: URL? {
        guard let logo else { return nil }
        return URL(string: logo)
    }
}
