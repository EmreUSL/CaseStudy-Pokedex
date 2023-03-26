//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by emre usul on 24.03.2023.
//

import UIKit
import Kingfisher


final class DetailScene: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var pokemon: PokemonDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
         
        congifureUI()
    }
    
    private func congifureUI() {
        if let pokemon = pokemon {
            detailName.text = pokemon.name.capitalizeFirstLetter()
            
            let url = URL(string: pokemon.sprites.front_default)
            detailImage.kf.setImage(with: url)
        }
    }
}

extension DetailScene: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon!.abilities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pokemon?.abilities[indexPath.row].ability.name?.capitalizeFirstLetter()
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
}
