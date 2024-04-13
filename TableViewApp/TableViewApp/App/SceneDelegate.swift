//
//  SceneDelegate.swift
//  TableViewApp
//
//  Created by Matvei Khlestov on 13.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = UINavigationController(rootViewController: FriendsViewController())
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

