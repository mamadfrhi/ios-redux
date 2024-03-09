//
//  SceneDelegate.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        
        let primaryButtonRenderer = PrimaryButtonRenderer()
        let secondaryButtonRenderer = SecondaryButtonRenderer()
        let vm = ButtonViewModel(initialState: SecondaryState(),
                                 primaryRenderer: primaryButtonRenderer,
                                 secondaryRenderer: secondaryButtonRenderer)
        let vc = ViewController(viewModel: vm)
        
        navController.viewControllers.append(vc)
        window?.makeKeyAndVisible()
    }
}
