//
//  centerSpotApp.swift
//  centerSpot
//
//  Created by Leonardo Soares on 21/09/2025.
//

import SwiftUI

@main
struct centerSpotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
