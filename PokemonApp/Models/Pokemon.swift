//
//  MainResponse.swift
//  PokemonApp
//
//  Created by emre usul on 24.03.2023.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [PokemonModel]
}

struct PokemonModel: Codable {
    let url: String?
}

struct PokemonDetail: Codable {
    let name: String
    let abilities: [Ability]
    let sprites: PokemonImage
}

struct Ability: Codable {
    let ability: PokemonAbility
}

struct PokemonAbility: Codable {
    let name: String?
}

struct PokemonImage: Codable {
    let front_default: String
}
