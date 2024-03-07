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
        
        let primaryRenderer = PrimaryButtonRenderer()
        let secondaryRenderer = SecondaryButtonRenderer()
        
        let reducer: ButtonReducer = { state, action in
            var newState = state
            
            switch action {
                
            case .setHighlight(let isHighlighted):
                
                newState.isHighlighted = isHighlighted
                
                switch state.buttonOrder {
                case .primary:
                    let primaryButton = primaryRenderer.render(buttonState: newState)
                    newState.backgroundColor = primaryButton.backgroundColor
                    newState.titleColor = primaryButton.titleColor
                    newState.titleHighlightColor = primaryButton.titleHighlightColor
                    newState.borderColor = primaryButton.borderColor
                case .secoundary:
                    let secondaryButton = secondaryRenderer.render(buttonState: newState)
                    newState.backgroundColor = secondaryButton.backgroundColor
                    newState.titleColor = secondaryButton.titleColor
                    newState.titleHighlightColor = secondaryButton.titleHighlightColor
                    newState.borderColor = secondaryButton.borderColor
                }
                
            case .setTitle(let title):
                newState.title = title
                
            case .setDisableStyle(let isDisabled):
                newState.isHighlighted = state.isHighlighted
                newState.isEnabled = !isDisabled
                
                print(newState.isEnabled)
                
                switch state.buttonOrder {
                case .primary:
                    newState = primaryRenderer.render(buttonState: newState)
                case .secoundary:
                    newState = secondaryRenderer.render(buttonState: newState)
                }
                
            case .setIcon(let brandButtonIcon):
                newState.iconName = brandButtonIcon.iconName
                newState.iconPosition = brandButtonIcon.iconPosition
                
                switch state.buttonOrder {
                case .primary:
                    newState = primaryRenderer.render(buttonState: newState)
                case .secoundary:
                    newState = secondaryRenderer.render(buttonState: newState)
                }
                
            case .setButtonOrder(let buttonOrder):
                if buttonOrder == state.buttonOrder { break }
                
                newState.buttonType = state.buttonType
                
                switch buttonOrder {
                case .primary:
                    newState.buttonOrder = .primary
                    newState = primaryRenderer.render(buttonState: newState)
                case .secoundary:
                    newState.buttonOrder = .secoundary
                    newState = secondaryRenderer.render(buttonState: newState)
                }
                
            case .setButtonType(buttonType: let buttonType):
                switch buttonType {
                case .actionButton:
                    newState.buttonType = .actionButton
                    switch newState.buttonOrder {
                    case .primary:
                        newState = primaryRenderer.render(buttonState: newState)
                    case .secoundary:
                        newState = secondaryRenderer.render(buttonState: newState)
                    }
                    
                case .successButton:
                    newState.buttonType = .successButton
                    switch newState.buttonOrder {
                    case .primary:
                        newState = primaryRenderer.render(buttonState: newState)
                    case .secoundary:
                        newState = secondaryRenderer.render(buttonState: newState)
                    }
                }
            }
            return newState
        }
        
        
        let initState = primaryRenderer.render(buttonState: PrimaryState())
//        let initState = secondaryRenderer.render(buttonState: SecondaryState())
        buttonStore = ButtonStore(initialState: initState, reducer: reducer)
        brandButton = BrandButton(store: buttonStore)
        
        let icon = BrandButtonIcon(iconPosition: .right)
        brandButton.store?.dispatch(action: .setIcon(brandButtonIcon: icon))
        
        brandButton.store?.dispatch(action: .setTitle("new title"))
        brandButton.store?.dispatch(action: .setDisableStyle(isDisabled: true))
        brandButton.store?.dispatch(action: .setButtonType(buttonType: .actionButton))
        brandButton.store?.dispatch(action: .setDisableStyle(isDisabled: false))
        brandButton.store?.dispatch(action: .setButtonOrder(buttonOrder: .secoundary))
        
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

