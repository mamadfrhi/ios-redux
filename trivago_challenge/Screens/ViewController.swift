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
        
        let reducer: ButtonReducer = { state, action in
            var newState = state
            
            switch action {
            case .setBackgroundColor:
                break
                
                
            case .setHighlight(let isHighlighted):
                switch state.buttonOrder {
                case .Primary:
                    let primaryButton = PrimaryState().render(isHighlighted: isHighlighted)
                    newState.backgroundColor = primaryButton.backgroundColor
                    newState.titleColor = primaryButton.titleColor
                    newState.titleHighlightColor = primaryButton.titleHighlightColor
                    newState.borderColor = primaryButton.borderColor
                case .Secoundary:
                    let secondaryButton = SecondaryState().render(isHighlighted: isHighlighted)
                    newState.backgroundColor = secondaryButton.backgroundColor
                    newState.titleColor = secondaryButton.titleColor
                    newState.titleHighlightColor = secondaryButton.titleHighlightColor
                    newState.borderColor = secondaryButton.borderColor
                }
                
            case .setTitle(let title):
                newState.title = title
                
            case .setDisableStyle(let order):
                
                var state: ButtonStateable
                switch order {
                case .Primary:
                    state = PrimaryState().render(isEnabled: false)
                case .Secoundary:
                    state = SecondaryState().render(isEnabled: false)
                }
                
                newState.backgroundColor = state.backgroundColor
                newState.titleColor = state.titleColor
                newState.borderColor = state.borderColor
                newState.isEnabled = false
                
            case .setIcon(iconName: let iconName, iconPosition: let iconPosition, let iconCalculator):
                if iconName == nil { break }
                if iconPosition == .left {
                    newState.leadingIcon = iconCalculator.calculateBrandButtonIcon(iconName: iconName,
                                                                                   buttonOrder: newState.buttonOrder)
                } else {
                    newState.trailingIcon = iconCalculator.calculateBrandButtonIcon(iconName: iconName,
                                                                                    buttonOrder: newState.buttonOrder)
                }
            }
            return newState
        }
        
        buttonStore = ButtonStore(initialState: SecondaryState().render(), reducer: reducer)
        brandButton = BrandButton(store: buttonStore)
        
        let iconCalculator = BrandButtonIconCalculater()
        brandButton.store?.dispatch(action: .setIcon(iconName: "square.fill",
                                                     iconPosition: .right,
                                                     brandButtonCalculator: iconCalculator))
        // REMOVE ORDER
        brandButton.store?.dispatch(action: .setDisableStyle(buttonOrder: brandButton.store!.state.buttonOrder))
        
        //TODO: if set disable then set order to primary, the style won't fit
        
        view.addSubview(brandButton)
        
        
        brandButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            brandButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            brandButton.heightAnchor.constraint(equalToConstant: 44),
            brandButton.widthAnchor.constraint(equalToConstant: 175)
        ])
    }
}

