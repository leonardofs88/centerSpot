
import Kingfisher
import SwiftUI

struct PlayerStatisticsDataView: View {
    @State private(set) var playerStatatistics: PlayerStatistics
    
    var body: some View {
        VStack {
            if let teamData = playerStatatistics.team {
                CollapsableContainerView("Team") {
                        CollapsableItemView(
                            "Team name:",
                            description: teamData.name
                        )
                }
            }
        }
    }
}
