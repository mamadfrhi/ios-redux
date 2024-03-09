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
    
    //TODO: Move to VM
    private var primaryRenderer: BrandButtonRenderable!
    private var secondaryRenderer: BrandButtonRenderable
    
    init(primaryRenderer: BrandButtonRenderable,
         secondaryRenderer: BrandButtonRenderable) {
        self.primaryRenderer = primaryRenderer
        self.secondaryRenderer = secondaryRenderer
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonStore()
        setupBrandButton()
        layoutBrandButton()
    }
    
    func setupButtonStore() {
        
        let reducer: ButtonReducer = { state, action in
            var newState = state
            
            switch action {
                
            case .setHighlight(let isHighlighted):
                
                newState.isHighlighted = isHighlighted
                
                switch state.buttonOrder {
                case .primary:
                    let primaryButton = self.primaryRenderer.render(buttonState: newState)
                    newState.backgroundColor = primaryButton.backgroundColor
                    newState.titleColor = primaryButton.titleColor
                    newState.titleHighlightColor = primaryButton.titleHighlightColor
                    newState.borderColor = primaryButton.borderColor
                case .secoundary:
                    let secondaryButton = self.secondaryRenderer.render(buttonState: newState)
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
                
                switch state.buttonOrder {
                case .primary:
                    newState = self.primaryRenderer.render(buttonState: newState)
                case .secoundary:
                    newState = self.secondaryRenderer.render(buttonState: newState)
                }
                
            case .setIcon(let brandButtonIcon):
                newState.iconName = brandButtonIcon.iconName
                newState.iconPosition = brandButtonIcon.iconPosition
                
                switch state.buttonOrder {
                case .primary:
                    newState = self.primaryRenderer.render(buttonState: newState)
                case .secoundary:
                    newState = self.secondaryRenderer.render(buttonState: newState)
                }
                
            case .setButtonOrder(let buttonOrder):
                
                if buttonOrder == state.buttonOrder { break }
                
                newState.buttonType = state.buttonType
                
                switch buttonOrder {
                case .primary:
                    newState.buttonOrder = .primary
                    newState = self.primaryRenderer.render(buttonState: newState)
                case .secoundary:
                    newState.buttonOrder = .secoundary
                    newState = self.secondaryRenderer.render(buttonState: newState)
                }
                
            case .setButtonType(buttonType: let buttonType):
                
                if state.buttonType == buttonType { break }
                
                switch buttonType {
                case .actionButton:
                    newState.buttonType = .actionButton
                    switch newState.buttonOrder {
                    case .primary:
                        newState = self.primaryRenderer.render(buttonState: newState)
                    case .secoundary:
                        newState = self.secondaryRenderer.render(buttonState: newState)
                    }
                    
                case .successButton:
                    newState.buttonType = .successButton
                    switch newState.buttonOrder {
                    case .primary:
                        newState = self.primaryRenderer.render(buttonState: newState)
                    case .secoundary:
                        newState = self.secondaryRenderer.render(buttonState: newState)
                    }
                }
            }
            return newState
        }
        
        let initialState = PrimaryState()
        self.buttonStore = ButtonStore(initialState: initialState, reducer: reducer)
    }
    
    private func setupBrandButton() {
        brandButton = BrandButton(store: buttonStore)
        buttonStore.configureInitialButtonState()
        view.addSubview(brandButton)
    }
    
    private func layoutBrandButton() {
        brandButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            brandButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            brandButton.heightAnchor.constraint(equalToConstant: 44),
            brandButton.widthAnchor.constraint(equalToConstant: 175)
        ])
    }
}

