//
//  MainTabBarViewController.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = Constants.Colors.green
        
        setupViewControllers()
    }
    
    private func getTabBarItem(for viewControllerName: UIViewController,
                               title: String,
                               image: UIImage?,
                               tag: Int) -> UIViewController {
        let viewController = viewControllerName
        viewController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return viewController
    }
    
    private func setupViewControllers() {
        let searchViewController = getTabBarItem(for: HomeViewController(),
                                                 title: "Главная",
                                                 image: .searchIcon,
                                                 tag: 0)
        let bookmarkViewController = getTabBarItem(for: BookmarkViewController(),
                                                 title: "Мой список",
                                                 image: .bookmarkIcon,
                                                 tag: 1)
        let shopsViewController = getTabBarItem(for: ShopsViewController(),
                                                 title: "Магазины",
                                                 image: .shopIcon,
                                                 tag: 2)
        let profileViewController = getTabBarItem(for: ProfileViewController(),
                                                 title: "Профиль",
                                                 image: .personIcon,
                                                 tag: 3)
        let cartViewController = getTabBarItem(for: CartViewController(),
                                                 title: "Корзина",
                                                 image: .cartIcon,
                                                 tag: 4)
    
        let viewControllerList = [searchViewController,
                                  bookmarkViewController,
                                  shopsViewController,
                                  profileViewController,
                                  cartViewController]
        viewControllers = viewControllerList
    }
}
