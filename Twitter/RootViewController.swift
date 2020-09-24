//
//  RootViewController.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let feedViewController = FeedViewController(style: .plain)
        let navigationController = UINavigationController(rootViewController: feedViewController)
        
        let profileController = ProfileViewController(user: User(id: 0, name: "Foo", avatar: nil))
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, profileController]
        
        addChild(tabBarController)
        
        tabBarController.view.frame = view.bounds
        tabBarController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
    
}
