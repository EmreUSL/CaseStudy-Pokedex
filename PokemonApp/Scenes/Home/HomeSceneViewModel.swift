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
    var count: Int = 0
    var service: ServiceManagerProtocol = ServiceManager()
    var pokemonURL: [PokemonModel] = []
    var pokemonData = [PokemonDetail]()
}

extension HomeSceneViewModel: HomeSceneViewModelInterface {
    func viewWillAppear() {
        getPokemonURLs()
    }
    
    func viewDidLoad() {
       view?.configureCollectionView()
    }
    
    var numberOfSection: Int {
        return pokemonURL.count
    }
    
    private func getPokemonURLs() {
        service.getPokemonURLs { result in
            switch result {
            case .success(let pokemon):
                self.pokemonURL = pokemon
                self.getAllPokemons()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAllPokemons() {
        
        for item in self.pokemonURL {
            guard let stringUrl = item.url else { return }
            service.getAllPokemons(url: stringUrl) { result in
                switch result {
                case .success(let pokemon):
                    self.pokemonData.append(pokemon)
                    self.count += 1
                    self.countEqual()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func countEqual() {
        if count == pokemonURL.count {
            view?.reloadCollectionView()
        }
    }
}




