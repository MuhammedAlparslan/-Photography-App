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
    
    func showClickedController(data: String) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotosController") as!  PhotosController
        controller.viewModel.walpaperId = data
        navigationController.show(controller, sender: nil)
    }
}
