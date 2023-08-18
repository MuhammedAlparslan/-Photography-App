//
//  DiscoveryController.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 25.05.2023.
//

import UIKit

class DiscoveryController: UIViewController {
    
    //    MARK: - Properties
    @IBOutlet private weak var discoveryCollection: UICollectionView!
    
    private var viewModel   = DiscoverViewModel()
    private var cellID      = "\(TopicCell.self)"
    private var coordinator: DiscoverCoordinator?
    
    
    //    MARK: - LifeCycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        configureCoordinator()
    }
    
    
    // MARK: - HELPER

    
    private func configureUI() {
        discoveryCollection.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        navigationItem.title = "Category"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .darkText
        
    }
    
    private func configureViewModel() {
        viewModel.getRandomPhoto()
        viewModel.successCallback = {
            self.discoveryCollection.reloadData()
        }
    }
    
    private func configureCoordinator() {
        coordinator = DiscoverCoordinator(navigationController: navigationController ?? UINavigationController())
    }
}


//MARK: - DiscoveryCollection

extension DiscoveryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TopicCell
        cell.configureData(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.showClickedController()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: discoveryCollection.frame.width, height: 430)

    }
}
