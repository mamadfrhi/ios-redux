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
            buttonType: .actionButton
        )
        
        let reducer: ButtonReducer = { state, action in
            var newState = state
            
            switch action {
            case .setBackgroundColor:
                break
                
                
            case .setHighlight(let backColor, let titleColor, let titleHighlight):
                newState.backgroundColor = backColor
                newState.titleColor = titleColor
                newState.titleHighlightColor = titleHighlight
                
                
            case .setTitle(let title):
                newState.title = title
                
            case .setOrder(let buttonOrder, let styleCalculator):
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
            case .setDisableStyle:
                newState.isEnabled = false
            case .setEnableStyle:
                newState.isEnabled = true
            }
            return newState
        }
        let styleCalculator = ButtonStyleCalculator()
        buttonStore = ButtonStore(initialState: initialState, reducer: reducer)
        brandButton = BrandButton(store: buttonStore)
        brandButton.store?.dispatch(action: .setOrder(.Secoundary, styleCalculator))
        brandButton.store?.dispatch(action: .setIcon("square.fill", .left, iconColor: .black))
        brandButton.store?.dispatch(action: .setEnableStyle)
        
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

