//
//  SceneDelegate.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let useSwiftUI = false
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewModel =
        ButtonViewModel(
            initialState: PrimaryState(),
            primaryRenderer:
                PrimaryButtonRenderer(styleCalculator: PrimaryButtonStyleCalculator(),
                                      disableStyleCalculator: ButtonDisableStyleCalculator(),
                                      iconCalculator: PrimaryButtonIconCalculater()),
            secondaryRenderer:
                SecondaryButtonRenderer(styleCalculator: SecondaryButtonStyleCalculator(),
                                        disableStyleCalculator: ButtonDisableStyleCalculator(),
                                        iconCalculator: SecondaryButtonIconCalculater()))
        
        
        if useSwiftUI {
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = UIHostingController(rootView: BrandButtonView(viewModel: viewModel))
            window?.makeKeyAndVisible()
        } else {
            let navController = UINavigationController()
            let vc = ViewController(viewModel: viewModel)
            navController.viewControllers = [vc]
            
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }
    }
}
