//
//  TabBarViewController.swift
//  SpotifyClone
//
//  Created by Vitor Gledison Oliveira de Souza on 20/05/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear

        let homeViewController = UIViewController()
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home",
                                                     image: UIImage(systemName: "house"),
                                                     selectedImage: UIImage(systemName: "house.fill"))
        
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Search",
                                                       image: UIImage(systemName: "magnifyingglass.circle"),
                                                       selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        let libraryViewController = UIViewController()
        libraryViewController.tabBarItem = UITabBarItem(title: "Your Library",
                                                     image: UIImage(systemName: "books.vertical"),
                                                     selectedImage: UIImage(systemName: "books.vertical.fill"))
        
        viewControllers = [
            homeViewController,
            searchViewController,
            libraryViewController
        ]
    }

}
