//
//  PokemonModel.swift
//  PokemonDex
//
//  Created by Mehdi Oturak on 10.10.2024.
//

import Foundation

struct PokemonPage: Decodable {
    let count: Int
    let next: String
    let results: [Pokemon]
}
struct Pokemon : Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "ulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    
}
struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
