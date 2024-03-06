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
    
    func calculateBackColor(buttonType: BrandButtonType,
                            buttonOrder: BrandButtonOrder,
                            isHighlighted: Bool) -> UIColor? {
        
        let backgroundColor: UIColor?
        
        switch buttonOrder {
        case .Primary:
            switch buttonType {
            case .successButton:
                backgroundColor = isHighlighted ? BrandPrimaryButtonColors.primarySuccessButtonHighlightColor : BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
            case .actionButton:
                backgroundColor = isHighlighted ? BrandPrimaryButtonColors.primaryActionButtonHighlightColor : BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
            }
        case .Secoundary:
            switch buttonType {
            case .successButton:
                backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondarySuccessButtonHighlightColor : nil
            case .actionButton:
                backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondaryActionButtonHighlightColor : nil
            }
        }
        
        return backgroundColor
    }
    
    func calculateTitleHighlightColor(buttonType: BrandButtonType,
                                      buttonOrder: BrandButtonOrder,
                                      isHighlighted: Bool) -> UIColor? {
        
        let titleHighlightColor: UIColor?
        
        switch buttonOrder {
        case .Primary:
            titleHighlightColor = .white
        case .Secoundary:
            switch buttonType {
            case .successButton:
                titleHighlightColor = isHighlighted ? .red :         BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
            case .actionButton:
                titleHighlightColor = isHighlighted ? BrandPrimaryButtonColors.primaryActionButtonHighlightColor :         BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
            }
            
        }
        
        return titleHighlightColor
    }
    
    func calculateTitleColor(buttonType: BrandButtonType,
                             buttonOrder: BrandButtonOrder,
                             isHighlighted: Bool
    ) -> UIColor {
        switch buttonOrder {
        case .Primary:
            return .white
        case .Secoundary:
            if isHighlighted {
                switch buttonType {
                case .successButton:
                    return BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
                case .actionButton:
                    return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
                }
            } else {
                switch buttonType {
                case .successButton:
                    return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
                case .actionButton:
                    return BrandPrimaryButtonColors.primaryActionButtonHighlightColor
                }
            }
            
        }
    }
    
    func calculateBorderColor(buttonType: BrandButtonType,
                              buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
        case .Primary:
            return nil
        case .Secoundary:
            switch buttonType {
            case .successButton:
                return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
            case .actionButton:
                return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.view.backgroundColor = .red
        
        let initialState = ButtonState(
            title: "Init State",
            backgroundColor: UIColor.red,
            titleColor: UIColor.white,
            leadingIconName: nil,
            trailingIconName: nil,
            isEnabled: true,
            isHighlighted: false,
            buttonOrder: .Secoundary,
            buttonType: .successButton
        )
        
        let reducer: ButtonReducer = { state, action in
            var newState = state
            
            switch action {
            case .setBackgroundColor:
                newState.backgroundColor = self.calculateBackColor(buttonType: state.buttonType,
                                                                   buttonOrder: state.buttonOrder,
                                                                   isHighlighted: false)
            case .setEnabled(let isEnabled):
                newState.isEnabled = isEnabled
                
            case .setHighlighted(let isHighlighted):
                newState.backgroundColor = self.calculateBackColor(buttonType: state.buttonType,
                                                                   buttonOrder: state.buttonOrder,
                                                                   isHighlighted: isHighlighted)
                newState.titleHighlightColor = self.calculateTitleHighlightColor(buttonType: state.buttonType,
                                                                                 buttonOrder: state.buttonOrder,
                                                                                 isHighlighted: isHighlighted)
                newState.titleColor = self.calculateTitleColor(buttonType: state.buttonType,
                                                               buttonOrder: state.buttonOrder,
                                                               isHighlighted: isHighlighted)
                
                
            case .setTitle(let title):
                newState.title = title
                
            case .setOrder(let buttonOrder):
                newState.buttonOrder = buttonOrder
                newState.backgroundColor = self.calculateBackColor(buttonType: state.buttonType,
                                                                   buttonOrder: buttonOrder,
                                                                   isHighlighted: false)
                newState.titleColor = self.calculateTitleColor(buttonType: state.buttonType,
                                                               buttonOrder: buttonOrder,
                                                               isHighlighted: false)
                newState.titleHighlightColor = self.calculateTitleHighlightColor(buttonType: state.buttonType,
                                                                                 buttonOrder: buttonOrder,
                                                                                 isHighlighted: false)
                newState.borderColor = self.calculateBorderColor(buttonType: newState.buttonType,
                                                                 buttonOrder: buttonOrder)
                
            case .setIcon(let iconName, let iconPosition, let iconColor):
                if iconName == nil { break }
                if iconPosition == .left {
                    newState.leadingIconName = iconName
                } else {
                    newState.trailingIconName = iconName
                }
                newState.iconColor = iconColor
            }
            return newState
        }
        
        buttonStore = ButtonStore(initialState: initialState, reducer: reducer)
        brandButton = BrandButton(store: buttonStore)
        brandButton.store?.dispatch(action: .setBackgroundColor)
        brandButton.store?.dispatch(action: .setOrder(.Primary))
        brandButton.store?.dispatch(action: .setIcon("square.fill", .left, iconColor: .black))
        
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

