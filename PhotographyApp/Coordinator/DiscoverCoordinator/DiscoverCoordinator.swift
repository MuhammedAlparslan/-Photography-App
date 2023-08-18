//
//  DiscoverCoordinator.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 18.08.2023.
//

import UIKit

class DiscoverCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotosController") as!  PhotosController
        navigationController.show(controller, sender: nil)
    }
}
