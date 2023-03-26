//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by emre usul on 24.03.2023.
//

import UIKit

protocol HomeSceneInterface: AnyObject {
    func reloadCollectionView()
    func configureCollectionView()
}

final class HomeScene: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = HomeSceneViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
         viewModel.view = self
         viewModel.viewDidLoad()
       
    }
}


extension HomeScene: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: PokemonCollectionViewCell.self, indexPath: indexPath)
        let name  = viewModel.pokemonData[indexPath.item].name.capitalizeFirstLetter()
        let imageStr = viewModel.pokemonData[indexPath.item].sprites.front_default
        cell.configureCell(name: name, imageStr: imageStr)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailScreen") as! DetailScene
        vc.pokemon = viewModel.pokemonData[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 120)
    }
    
}

extension HomeScene: HomeSceneInterface {
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func configureCollectionView() {
        collectionView.register(cellType: PokemonCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
}

