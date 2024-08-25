//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Vladislav Simonov on 25.08.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        let viewController = SettingsViewController(viewModel: SettingsViewModel())
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
