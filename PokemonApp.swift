//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Justin Spencer on 4/24/24.
//

import SwiftUI
import SwiftData

@main
struct PokemonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Description.self)


    }
}
