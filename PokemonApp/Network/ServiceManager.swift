//
//  ServiceManager.swift
//  PokemonApp
//
//  Created by emre usul on 24.03.2023.
//

import Foundation

protocol ServiceManagerProtocol {
    func getPokemonURLs(completion: @escaping (Result<[PokemonModel], Error>) -> Void)
    func getAllPokemons(url: String, completion: @escaping (Result<PokemonDetail, Error>) -> Void)
}

final class ServiceManager: ServiceManagerProtocol {
       
    func getPokemonURLs(completion: @escaping (Result<[PokemonModel], Error>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=40")!
        
        URLSession.shared.fetchData(for: url) { (result: Result<PokemonResponse,Error>) in
            switch result {
            case .success(let pokemon):
                completion(.success(pokemon.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAllPokemons(url: String, completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.fetchData(for: url) { (result: Result<PokemonDetail,Error>) in
            switch result {
                
            case .success(let pokemon):
                completion(.success(pokemon))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

