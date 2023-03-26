//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by emre usul on 24.03.2023.
//

import Foundation

protocol HomeSceneViewModelInterface {
    var view: HomeSceneInterface? { get set }
    func viewWillAppear()
    func viewDidLoad()
    var numberOfSection: Int { get }
}


final class HomeSceneViewModel {
    var view: HomeSceneInterface?
    var service: ServiceManagerProtocol = ServiceManager()
    var pokemon: [PokemonModel] = []
    var pokemonData = [PokemonDetail]()
}

extension HomeSceneViewModel: HomeSceneViewModelInterface {
    func viewWillAppear() {
        getPokemons()
    }
    
    func viewDidLoad() {
       view?.configureCollectionView()
    }
    
    var numberOfSection: Int {
        return pokemon.count
    }
    
    private func getPokemons() {
        service.getPokemonURLs { result in
            switch result {
            case .success(let pokemon):
                self.pokemon = pokemon
                self.getAllPokemons()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAllPokemons() {
        
        for item in self.pokemon {
            guard let stringUrl = item.url else { return }
            service.getAllPokemons(url: stringUrl) { result in
                switch result {
                case .success(let pokemon):
                    self.pokemonData.append(pokemon)
                    if self.pokemonData.count == 40 {
                        self.view?.reloadCollectionView()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}




