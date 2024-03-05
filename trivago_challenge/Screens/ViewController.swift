//
//  ViewController.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var brandButton: BrandButton!
    private var buttonStore: ButtonStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialState = ButtonState(
            title: "Primary Default",
            backgroundColor: UIColor.systemGreen,
            titleColor: UIColor.red,
            leadingIconName: nil,
            trailingIconName: nil,
            isEnabled: true,
            isHighlighted: false
        )
        
        let reducer: ButtonReducer = { state, action in
            var newState = state
            switch action {
            case .setEnabled(let isEnabled):
                newState.isEnabled = isEnabled
                
            case .setHighlighted(let isHighlighted):
                newState.isHighlighted = isHighlighted
                
            case .setTitle(let title):
                newState.title = title
                
            case .setOrder(let buttonOrder):
                newState.backgroundColor =
                (buttonOrder == .Primary) ?
                UIColor(ciColor: .blue)   : UIColor(ciColor: .green)
                
            case .setIcon(let iconName, let iconPosition):
                if iconPosition == .left {
                    newState.leadingIconName = iconName
                } else {
                    newState.trailingIconName = iconName
                }
            }
            return newState
        }
        
        buttonStore = ButtonStore(initialState: initialState, reducer: reducer)
        brandButton = BrandButton(store: buttonStore)
        brandButton.store?.dispatch(action: .setOrder(.Secoundary))
        brandButton.store?.dispatch(action: .setHighlighted(false))
        brandButton.store?.dispatch(action: .setIcon("square", .left))
        
        // Add the button to the view
        view.addSubview(brandButton)
        
        brandButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            brandButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            brandButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

