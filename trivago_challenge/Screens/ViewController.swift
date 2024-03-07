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
                
            case .setHighlight(let isHighlighted):
                
                newState.isHighlighted = isHighlighted
                
                switch state.buttonOrder {
                case .Primary:
                    let primaryButton = state.render(isHighlighted: isHighlighted, isEnabled: state.isEnabled)
                    newState.backgroundColor = primaryButton.backgroundColor
                    newState.titleColor = primaryButton.titleColor
                    newState.titleHighlightColor = primaryButton.titleHighlightColor
                    newState.borderColor = primaryButton.borderColor
                case .Secoundary:
                    let secondaryButton = state.render(isHighlighted: isHighlighted, isEnabled: state.isEnabled)
                    newState.backgroundColor = secondaryButton.backgroundColor
                    newState.titleColor = secondaryButton.titleColor
                    newState.titleHighlightColor = secondaryButton.titleHighlightColor
                    newState.borderColor = secondaryButton.borderColor
                }
                
            case .setTitle(let title):
                newState.title = title
                
            case .setDisableStyle(let order):
                switch order {
                case .Primary:
                    newState = state.render(isHighlighted: state.isHighlighted, isEnabled: false)
                case .Secoundary:
                    newState = state.render(isHighlighted: state.isHighlighted, isEnabled: false)
                }
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
            case .setButtonType(let buttonType):
                if buttonType.hashValue == newState.buttonType.hashValue { return state }
                
                switch buttonType {
                case .actionButton:
                    newState.buttonType = .actionButton
                    let newButton = newState.render(isHighlighted: state.isHighlighted,
                                                 isEnabled: state.isEnabled)
                    newState.backgroundColor = newButton.backgroundColor
                    newState.titleColor = newButton.titleColor
                    newState.titleHighlightColor = newButton.titleHighlightColor
                    newState.borderColor = newButton.borderColor
                case .successButton:
                    newState.buttonType = .successButton
                    let newButton = state.render(isHighlighted: state.isHighlighted,
                                                 isEnabled: state.isEnabled)
                    newState.backgroundColor = newButton.backgroundColor
                    newState.titleColor = newButton.titleColor
                    newState.titleHighlightColor = newButton.titleHighlightColor
                    newState.borderColor = newButton.borderColor
                }
            }
            return newState
        }
        
        buttonStore = ButtonStore(initialState: SecondaryState().render(), reducer: reducer)
        brandButton = BrandButton(store: buttonStore)
        
        let iconCalculator = ButtonIconCalculater()
//        brandButton.store?.dispatch(action: .setIcon(iconName: "square.fill",
//                                                     iconPosition: .right,
//                                                     brandButtonCalculator: iconCalculator))
        
        brandButton.store?.dispatch(action: .setButtonType(.actionButton))
        brandButton.store?.dispatch(action: .setDisableStyle(buttonOrder: brandButton.store!.state.buttonOrder))
        brandButton.store?.dispatch(action: .setTitle("new title"))
        
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

