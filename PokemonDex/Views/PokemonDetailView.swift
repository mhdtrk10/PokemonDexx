//
//  PokemonDetailView.swift
//  PokemonDex
//
//  Created by Mehdi Oturak on 11.10.2024.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            
            PokemonView(pokemon: pokemon)
            
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetail?.id ?? 0)")
                Text("**weight**: \(vm.formatHW(value: vm.pokemonDetail?.height ?? 0)) KG")
                Text("**height**: \(vm.formatHW(value: vm.pokemonDetail?.weight ?? 0)) M")
            }
            
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
        
    }
        
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
