//
//  PokemonCollectionViewCell.swift
//  PokemonApp
//
//  Created by emre usul on 26.03.2023.
//

import UIKit
import Kingfisher

final class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokemonView: UIView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSetting()
    }
    
    private func viewSetting() {
        pokemonView.layer.cornerRadius = 30
        pokemonView.layer.shadowOffset = CGSize(width: 0,
                                                height: 5)
        pokemonView.layer.shadowOpacity = 0.5
    }
    
    public func configureCell(name: String, imageStr: String) {
        pokemonLabel.text = name
        
        let url = URL(string: imageStr)
        pokemonImage.kf.setImage(with: url)
    }

}
