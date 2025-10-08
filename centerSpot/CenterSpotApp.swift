//
//  CenterSpotApp.swift
//  centerSpot
//
//  Created by Leonardo Soares on 21/09/2025.
//

import SwiftUI

@main
struct CenterSpotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                StartView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .foregroundStyle(Color.white)
            .font(.custom(.CustomFonts.dinNormal, size: 17))
        }
        
    }
}

extension String {
    struct CustomFonts {
        static var dinNormal: String { "DINAlternate"}
        static var dinBold: String { "DINAlternate-Bold"}
        static var dinCondensed: String { "DINCondensed"}
        static var dinCondensedBold: String { "DINCondensed-Bold"}
    }
}
