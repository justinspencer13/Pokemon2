//
//  ContentView.swift
//  Pokemon
//
//  Created by Justin Spencer on 4/24/24.
//

import SwiftUI
import SwiftData

struct PokemonList: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
        }

struct ContentView: View {
    @State private var pokemonList: [Pokemon] = []
    @State private var descriptions: [Description] = []
    func fetchPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(PokemonList.self, from: data) {
                DispatchQueue.main.async {
                    self.pokemonList = decodedResponse.results
                }
            } else {
                print("Failed to decode JSON")
            }
        }.resume()
    }

    var body: some View {
        NavigationView {
            List(pokemonList, id: \.name) { pokemon in
                NavigationLink(destination: DetailView(descriptions: $descriptions, pokemon: pokemon)) {
                    VStack {
                        Text("\(pokemon.name)")
                    }
                }
            }
            .navigationBarTitle("Pokémon")
        }
        .onAppear(perform: fetchPokemon)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
