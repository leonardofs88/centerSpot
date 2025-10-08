//
//  PlayerProfileViewModel.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

@MainActor
protocol PlayerProfileViewModelProtocol {
    var player: PlayerProfile? { get }
    var playerStatatistics: PlayerStatistics? { get }
}

@Observable
class PlayerProfileViewModel: PlayerProfileViewModelProtocol {
    private(set) var player: PlayerProfile?
    private(set) var playerStatatistics: PlayerStatistics?
    
    init() {
        if let path = Bundle.main.path(forResource: "Player", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedJSON = try JSONDecoder().decode(PlayerContainer.self, from: data)
                player = decodedJSON.player
            } catch {
                print("cant load player: ", error.localizedDescription.debugDescription)
            }
        }
        
        if let path = Bundle.main.path(forResource: "Statistics", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedJSON = try JSONDecoder().decode(DataContainerResponse.self, from: data)
                playerStatatistics = decodedJSON.response.flatMap({ $0.statistics.compactMap { $0 } }).first
                
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                if let jsonResult = jsonResult as? [String: AnyObject] {
//                    print("json result: ", jsonResult["response"])
//                }
//                let statistics = jsonResult["response"]?["statistics"] as? [PlayerStatistics],
//                let statistic = statistics.first {
//                    self.playerStatatistics = statistic
//                    print("statistics: ",statistic)
//                }
            } catch {
                print("cant load stats: ", error as? DecodingError)
            }
        }
    }
}
