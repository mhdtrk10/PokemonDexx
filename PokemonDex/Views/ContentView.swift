//
//  ContentView.swift
//  PokemonDex
//
//  Created by Mehdi Oturak on 10.10.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var vm  = ViewModel()
    
    private var adaptiveColumns = [
        GridItem(.adaptive(minimum: 1350))
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}


#Preview {
    ContentView()
}
