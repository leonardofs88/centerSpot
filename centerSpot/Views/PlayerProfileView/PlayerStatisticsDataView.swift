//
//  PlayerStatisticsDataView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 03/10/2025.
//

import SwiftUI
import UIKit

struct PlayerStatisticsDataView: View {
    
    @Namespace var teamNamespace
    @Namespace var leagueNamespace
    @Namespace var gameNamespace
    
    @State private(set) var playerStatistics: PlayerStatistics
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            if let teamData = playerStatistics.team {
                CollapsableContainerView("Team") {
                    VStack(alignment: .center) {
                        AppSystemText(teamData.name)
                        AsyncImage(url: teamData.logoURL) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                
                            } else if phase.error != nil {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .frame(width: 250, height: 250)
                            } else {
                                ProgressView()
                            }
                        }
                    }
                } action: {
                    action()
                }
            }
            
            if let league = playerStatistics.league {
                CollapsableContainerView("League") {
                    VStack {
                        CollapsableItemView("Name: ", description: league.name)
                        CollapsableItemView("Country: ", description: league.country)
                        
                        CollapsableItemView("Season: ", description: league.season)
                        
                        HStack {
                            if let logo = league.logoURL {
                                AsyncImage(url: logo) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                        
                                    } else if phase.error != nil {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red)
                                            .frame(width: 250, height: 250)
                                    } else {
                                        ProgressView()
                                    }
                                }
                            }
                        }
                    }
                } action: {
                    action()
                }
            }
            
            if let game = playerStatistics.game {
                CollapsableContainerView("Games statistics") {
                    VStack {
                        CollapsableItemView(
                            "Appearances: ",
                            description: game.appearences
                        )
                        
                        CollapsableItemView(
                            "Line-ups: ",
                            description: game.lineups
                        )
                        
                        CollapsableItemView(
                            "Minutes: ",
                            description: game.minutes
                        )
                        
                        CollapsableItemView(
                            "Number: ",
                            description: game.number
                        )
                        
                        CollapsableItemView(
                            "Position: ",
                            description: game.position
                        )
                        
                        CollapsableItemView(
                            "Rating: ",
                            description: game.rating
                        )
                        
                        CollapsableItemView(
                            "Captain: ",
                            description: game.captain
                        )
                    }
                } action: {
                    action()
                }
            }
        }
    }
}

#Preview {
    PlayerStatisticsDataView(
        playerStatistics: PlayerStatistics(
            team: Team(id: 1, name: "TeamName", logo: nil),
            league: nil,
            game: nil,
            substitutes: nil,
            shots: nil,
            goals: nil,
            passes: nil,
            tackles: nil,
            dribbles: nil,
            fouls: nil,
            cards: nil,
            penalties: nil
        )) {
            print("tapped")
        }
}
