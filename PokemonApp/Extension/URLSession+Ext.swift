//
//  URLSession+Ext.swift
//  PokemonApp
//
//  Created by emre usul on 26.03.2023.
//

import Foundation

extension URLSession {
    func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                    
                    
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}
