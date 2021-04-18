//
//  AppDelegate.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = createNavigationController()
        window?.makeKeyAndVisible()

        return true
    }

    private func createNavigationController() -> UINavigationController {
        let mainViewController = MainTabBarViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.isHidden = true

        return navigationController
    }
}

