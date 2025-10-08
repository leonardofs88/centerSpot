//
//  DataContainer.swift
//  centerSpot
//
//  Created by Leonardo Soares on 02/10/2025.
//

import Foundation

struct DataContainer: Codable {
    let statistics: [PlayerStatistics]
}

struct DataContainerResponse: Codable {
    let response: [DataContainer]
}
