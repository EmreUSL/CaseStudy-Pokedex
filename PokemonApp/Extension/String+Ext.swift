//
//  String+Ext.swift
//  PokemonApp
//
//  Created by emre usul on 26.03.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
