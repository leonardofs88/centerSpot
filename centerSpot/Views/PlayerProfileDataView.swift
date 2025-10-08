

struct PlayerProfileDataView: View {
    @State private(set) var playerProfile: PlayerProfile
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: playerProfile.photoURL)
            CollapsableContainerView(playerProfile.firstName) {
                VStack {
                    CollapsableItemView(
                        title: "First Name:",
                        description: playerProfile.firstName
                    )
                    
                    CollapsableItemView(
                        title: "Last Name:",
                        description: playerProfile.lastName
                    )
                    
                    CollapsableItemView(
                        title: "Nationality:",
                        description: playerProfile.nationality
                    )
                    
                    CollapsableItemView(
                        title: "Height:",
                        description: playerProfile.height
                    )
                    
                    CollapsableItemView(
                        title: "Weight:",
                        description: playerProfile.weight
                    )
                }
            }
            
            CollapsableContainerView(
                "Age",
                description: "\(playerProfile.age)"
            ) {
                VStack {
                    
                    CollapsableItemView(
                        title: "Age:",
                        description: "\(playerProfile.age)"
                    )
                    
                    CollapsableItemView(
                        title: "Birth Date:",
                        description: playerProfile.birth.date
                    )
                    
                    CollapsableItemView(
                        title: "Place of Birth:",
                        description: playerProfile.birth.place
                    )
                    
                    CollapsableItemView(
                        title:"Country:",
                        description: playerProfile.birth.country
                    )
                }
            }
        }
    }
}