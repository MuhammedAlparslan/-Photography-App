//
//  LaunchScreenCoordinator.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 18.08.2023.
//

import UIKit

class LaunchScrennCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginController") as!  LoginController
        navigationController.show(controller, sender: nil)
    }
    
}
