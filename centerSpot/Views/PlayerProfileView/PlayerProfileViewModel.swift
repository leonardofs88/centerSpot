//
//  PlayerProfileViewModel.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

@MainActor
protocol PlayerProfileViewModelProtocol {
    var player: PlayerProfile { get }
}

@Observable
class PlayerProfileViewModel: PlayerProfileViewModelProtocol {
    private(set) var player: PlayerProfile
    
    init() {
        self.player = PlayerProfile(
            id: 1,
            name: "SomePlayer",
            firstName: "SomePlayer",
            lastName: "SomePlayerLastName",
            age: 20,
            nationality: "SomePlayerNationality",
            height: "180 cm",
            weight: "63 kg",
            number: 10,
            position: "Attacker",
            photo: "https://media.api-sports.io/football/players/276.png",
            birth: PlayerBirthData(
                date: "2000-03-22",
                place: "SomePlace",
                country: "SomeCountry"
            )
        )
    }
    
}
