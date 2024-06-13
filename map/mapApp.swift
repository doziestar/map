//
//  mapApp.swift
//  map
//
//  Created by Chidozie Okafor on 12/06/2024.
//

import SwiftUI
import SwiftData

@main
struct mapApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Position.self,
            Style.self,
            NoteItem.self,
            Stack.self,
            Map.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

