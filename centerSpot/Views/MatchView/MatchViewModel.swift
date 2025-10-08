//
//  MatchViewModel.swift
//  centerSpot
//
//  Created by Leonardo Soares on 06/10/2025.
//

import SwiftUI
import Foundation

@MainActor
protocol MatchViewModelProtocol {
    var matchData: MatchModel? { get }
}

@Observable
class MatchViewModel: MatchViewModelProtocol {
    private(set) var matchData: MatchModel?
}
