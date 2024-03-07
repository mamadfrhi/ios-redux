//
//  PrimaryButtonRenderer.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import Foundation

struct PrimaryButtonRenderer: BrandButtonRenderable {
    
    var styleCalculator:
    ButtonStyleCalculable = PrimaryButtonStyleCalculator()
    
    var disableStyleCalculator:
    ButtonDisableStyleCalculable = ButtonDisableStyleCalculator()
    
    var iconCalculator:
    ButtonIconCalculable = SecondaryButtonIconCalculater()
    
    func render(buttonState: ButtonStateable) -> ButtonStateable {
        
        var buttonState = buttonState
        
        if buttonState.isEnabled {
            buttonState.backgroundColor = styleCalculator
                .calculateBackColor(buttonType: buttonState.buttonType,
                                    buttonOrder: buttonState.buttonOrder,
                                    isHighlighted: buttonState.isHighlighted)
            buttonState.titleColor = styleCalculator
                .calculateTitleColor(buttonType:buttonState.buttonType,
                                     buttonOrder: buttonState.buttonOrder,
                                     isHighlighted: buttonState.isHighlighted)
            buttonState.titleHighlightColor = styleCalculator
                .calculateTitleHighlightColor(buttonType: buttonState.buttonType,
                                              buttonOrder: buttonState.buttonOrder,
                                              isHighlighted: buttonState.isHighlighted)
        } else {
            buttonState.backgroundColor = disableStyleCalculator
                .calculateDisableBackgroundColor(buttonOrder: buttonState.buttonOrder)
            buttonState.titleColor = disableStyleCalculator
                .calculateDisableTitleColor(buttonOrder: buttonState.buttonOrder)
            buttonState.borderColor = disableStyleCalculator
                .calculateDisableBorderColor(buttonOrder: buttonState.buttonOrder)
        }
        
        buttonState.iconImage = iconCalculator
            .calculateIcon(iconName: buttonState.iconName)
        
        return buttonState
    }
}
