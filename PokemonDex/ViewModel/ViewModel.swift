//
//  ViewModel.swift
//  PokemonDex
//
//  Created by Mehdi Oturak on 10.10.2024.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetail: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
        
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetail = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetail = data
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let dvalue = Double(value)
        let string = String(format: "%.2f", dvalue / 10)
        
        return string
    }
}
