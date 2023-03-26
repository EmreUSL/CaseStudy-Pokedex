//
//  UICollectionViewCell+Ext.swift
//  PokemonApp
//
//  Created by emre usul on 26.03.2023.
//

import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}

