//
//  SubstitutionData.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import Foundation

struct SubstitutionData: Codable {
    let inValue: Int?
    let outValue: Int?
    let bench: Int?
    
    enum CodingKeys: String, CodingKey {
        case inValue = "in"
        case outValue = "out"
        case bench
    }
}
