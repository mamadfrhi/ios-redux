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
        
        let reducer: ButtonReducer = { state, action, styleCalculator in
            var newState = state
            
            switch action {
            case .setBackgroundColor:
                newState.backgroundColor = styleCalculator.calculateBackColor(buttonType: state.buttonType,
                                                                                               buttonOrder: state.buttonOrder,
                                                                                               isHighlighted: false)
            case .setEnabled(let isEnabled):
                newState.isEnabled = isEnabled
                
            case .setHighlighted(let isHighlighted):
                newState.backgroundColor = styleCalculator.calculateBackColor(buttonType: state.buttonType,
                                                                                               buttonOrder: state.buttonOrder,
                                                                                               isHighlighted: isHighlighted)
                newState.titleHighlightColor = styleCalculator.calculateTitleHighlightColor(buttonType: state.buttonType,
                                                                                                             buttonOrder: state.buttonOrder,
                                                                                                             isHighlighted: isHighlighted)
                newState.titleColor = styleCalculator.calculateTitleColor(buttonType: state.buttonType,
                                                                                           buttonOrder: state.buttonOrder,
                                                                                           isHighlighted: isHighlighted)
                
                
            case .setTitle(let title):
                newState.title = title
                
            case .setOrder(let buttonOrder):
                newState.buttonOrder = buttonOrder
                newState.backgroundColor = styleCalculator.calculateBackColor(buttonType: state.buttonType,
                                                                                               buttonOrder: buttonOrder,
                                                                                               isHighlighted: false)
                newState.titleColor = styleCalculator.calculateTitleColor(buttonType: state.buttonType,
                                                                                           buttonOrder: buttonOrder,
                                                                                           isHighlighted: false)
                newState.titleHighlightColor = styleCalculator.calculateTitleHighlightColor(buttonType: state.buttonType,
                                                                                                             buttonOrder: buttonOrder,
                                                                                                             isHighlighted: false)
                newState.borderColor = styleCalculator.calculateBorderColor(buttonType: newState.buttonType,
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
        let styleCalculator = ButtonStyleCalculator()
        buttonStore = ButtonStore(initialState: initialState, reducer: reducer, styleCalculator: styleCalculator)
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

