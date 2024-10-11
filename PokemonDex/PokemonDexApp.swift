//
//  PokemonDexApp.swift
//  PokemonDex
//
//  Created by Mehdi Oturak on 10.10.2024.
//

import SwiftUI

@main
struct PokemonDexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
