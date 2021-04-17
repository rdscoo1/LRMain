//
//  SceneDelegate.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = createNavigationController()
        self.window?.makeKeyAndVisible()
    }
    
    private func createNavigationController() -> UINavigationController {
        let mainViewController = MainViewController()
        mainViewController.title = "Поиск"
        
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}

