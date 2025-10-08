//
//  PlayerProfile.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct PlayerProfile: Codable, Identifiable {
    let id: Int?
    let name: String?
    let firstName: String?
    let lastName: String?
    let age: Int?
    let birth: PlayerBirthData?
    let nationality: String?
    let height: String?
    let weight: String?
    let number: Int?
    let position: String?
    let photo: String?
    
    var photoURL: URL? {
        guard let photo else { return nil }
        return URL(string: photo)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case firstName = "firstname"
        case lastName = "lastname"
        case age
        case birth
        case nationality
        case height
        case weight
        case number
        case position
        case photo
    }
}

struct PlayerBirthData: Codable {
    let date: String
    let place: String
    let country: String
}
