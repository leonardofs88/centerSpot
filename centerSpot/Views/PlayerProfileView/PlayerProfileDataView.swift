//
//  PlayerProfileDataView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 02/10/2025.
//

import SwiftUI

struct PlayerProfileDataView: View {
    @State private(set) var playerProfile: PlayerProfile
    
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: playerProfile.photoURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 2, x: 4, y: 4)
                        .frame(width: 250, height: 250)
                } else
                    if phase.error != nil {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 250, height: 250)
                } else {
                    ProgressView()
                }
            }
            
            CollapsableContainerView("Player info") {
                VStack {
                    CollapsableItemView(
                        "First Name:",
                        description: playerProfile.firstName
                    )
                    
                    CollapsableItemView(
                        "Last Name:",
                        description: playerProfile.lastName
                    )
                    
                    CollapsableItemView(
                        "Nationality:",
                        description: playerProfile.nationality
                    )
                    
                    CollapsableItemView(
                        "Height:",
                        description: playerProfile.height
                    )
                    
                    CollapsableItemView(
                        "Weight:",
                        description: playerProfile.weight
                    )
                    
                    CollapsableItemView(
                        "Age:",
                        description: playerProfile.age
                    )
                    
                    CollapsableItemView(
                        "Birth Date:",
                        description: playerProfile.birth?.date
                    )
                    
                    CollapsableItemView(
                        "Place of Birth:",
                        description: playerProfile.birth?.place
                    )
                    
                    CollapsableItemView(
                        "Country:",
                        description: playerProfile.birth?.country
                    )
                }
            }
            action : {
                action()
            }
        }
    }
}

#Preview {
    PlayerProfileDataView(
        playerProfile: PlayerProfile(
            id: 2,
            name: "Name",
            firstName: "FirstName",
            lastName: "LastName",
            age: 22,
            birth: nil,
            nationality: "SomeNation",
            height: "65 kg",
            weight: "174 cm",
            number: 23,
            position: "Attacker",
            photo: nil
        )
    ) {
        print("tapped")
    }
}
