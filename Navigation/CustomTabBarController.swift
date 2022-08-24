//
//  CustomTabControllerViewController.swift
//  Navigation
//
//  Created by Иван Сёмин on 20.08.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .systemGreen
        self.tabBar.tintColor = .white  // Selected tab color
        self.tabBar.unselectedItemTintColor = .black
        
        self.viewControllers = [
            self.createNavigationControllerFrom(controller: FeedViewController(), title: "Feed", image: UIImage(systemName: "newspaper.fill")!),
            self.createNavigationControllerFrom(controller: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person.crop.circle.fill")!),
        ]
    }
    
    private func createNavigationControllerFrom(controller: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let rootController = controller
        
        rootController.tabBarItem.title = title
        rootController.tabBarItem.image = image
        
        return UINavigationController(rootViewController: rootController)
    }
}
