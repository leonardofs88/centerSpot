//
//  PlayerProfileView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 21/09/2025.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct PlayerProfileView<VM: PlayerProfileViewModelProtocol>: View {
    @Namespace var switchAnimation
    
    @State private(set) var playerProfileViewModel: VM
    
    @State private var showMatchForm: Bool = false
    
    var body: some View {
        ZStack {
            if showMatchForm {
                MatchView(matchViewModel: MatchViewModel(),
                          isFormPresented: $showMatchForm)
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .scale
                        )
                    )
                    .matchedGeometryEffect(
                        id: "switch",
                        in: switchAnimation,
                        properties: [.position]
                    )
            } else {
                ScrollViewReader { proxy in
                    ScrollView {
                        if let playerProfile = playerProfileViewModel.player {
                            PlayerProfileDataView(
                                playerProfile: playerProfile
                            ) {
                                withAnimation {
                                    proxy.scrollTo("player", anchor: .bottom)
                                }
                            }
                            .id("player")
                        }
                        
                        if let playerStatatistics = playerProfileViewModel.playerStatatistics {
                            PlayerStatisticsDataView(
                                playerStatistics: playerStatatistics
                            ) {
                                withAnimation {
                                    proxy.scrollTo("team", anchor: .bottom)
                                }
                            }
                            .id("team")
                        }
                        
                        VStack {
                            HStack(
                                alignment: .center
                            ) {
                                AppSystemText(
                                    "Highlights",
                                    weight: .bold,
                                    size: 20
                                )
                            }
                            
                            VideoPlayer(
                                player: AVPlayer(url:  Bundle.main.url(forResource: "Highlights", withExtension: "mp4")!)
                            )
                            .frame(height: 200)
                        }
                    } //: ScrollView
                } //: ScrollViewReader
                .transition(
                    .asymmetric(
                        insertion: .scale,
                        removal: .scale
                    )
                )
                .matchedGeometryEffect(
                    id: "switch",
                    in: switchAnimation,
                    properties: [.position]
                )
                .background(Color.white)
            }
        } //: ZSTACK
        .toolbar {
            if !showMatchForm {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        withAnimation {
                            showMatchForm.toggle()
                        }
                    } label: {
                        AppSystemText("New Match", weight: .bold, color: .white)
                    }
                    .buttonStyle(
                        AppSystemButtonStyle()
                    )
                }
            }
        }
        .navigationTitle(playerProfileViewModel.player?.name ?? "")
        .padding()
    }
}

#Preview {
    NavigationStack {
        PlayerProfileView(
            playerProfileViewModel: PlayerProfileViewModel()
        )
    }
}
