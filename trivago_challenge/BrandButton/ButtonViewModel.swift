//
//  BrandButtonVM.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 09.03.24.
//

import UIKit

class ButtonViewModel {
    
    private var buttonStore: ButtonStore?
    private let initialState: ButtonStateable
    private let primaryRenderer: BrandButtonRenderable
    private let secondaryRenderer: BrandButtonRenderable
    
    var stateDidChange: ((ButtonStateable) -> Void)?

    init(initialState: ButtonStateable,
         primaryRenderer: BrandButtonRenderable,
         secondaryRenderer: BrandButtonRenderable) {
        
        self.initialState = initialState
        self.primaryRenderer = primaryRenderer
        self.secondaryRenderer = secondaryRenderer
        self.buttonStore = ButtonStore(initialState: initialState,
                                       reducer: createReducer())
    }

    private func createReducer() -> ButtonReducer {
        return { [weak self] state, action in
            guard let self = self else { return state }
            return self.handleAction(state: state, action: action)
        }
    }

    private func handleAction(state: ButtonStateable,
                              action: ButtonAction) -> ButtonStateable {
        
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
                newState.title = "Primary Button"
            case .secoundary:
                newState.buttonOrder = .secoundary
                newState = self.secondaryRenderer.render(buttonState: newState)
                newState.title = "Secondary Button"
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
        stateDidChange?(newState)
        return newState
    }

    func dispatch(_ action: ButtonAction) {
        buttonStore?.dispatch(action: action)
    }
}

