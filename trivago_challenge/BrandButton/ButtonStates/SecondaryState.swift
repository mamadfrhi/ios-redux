//
//  SecondaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

class SecondaryState: ButtonStateable {
    
    let secondaryStyleCalculator = SecondaryButtonStyleCalculator()
    let disableStyleCalculator = ButtonDisableStyleCalculator()
    
    func render(isHighlighted: Bool = false, isEnabled: Bool = true) -> ButtonStateable {
        if isEnabled {
            self.backgroundColor = secondaryStyleCalculator.calculateBackColor(buttonType: self.buttonType,
                                                                      buttonOrder: self.buttonOrder,
                                                                      isHighlighted: isHighlighted)
            self.titleColor = secondaryStyleCalculator.calculateTitleColor(buttonType: self.buttonType,
                                                                  buttonOrder: self.buttonOrder,
                                                                  isHighlighted: isHighlighted)
            self.titleHighlightColor = secondaryStyleCalculator.calculateTitleHighlightColor(buttonType: self.buttonType,
                                                                                    buttonOrder: self.buttonOrder,
                                                                                    isHighlighted: isHighlighted)
            self.borderColor = secondaryStyleCalculator.calculateBorderColor(buttonType: self.buttonType, buttonOrder: self.buttonOrder)
        } else {
            self.backgroundColor = disableStyleCalculator.calculateDisableBackgroundColor(buttonOrder: self.buttonOrder)
            self.titleColor = disableStyleCalculator.calculateDisableTitleColor(buttonOrder: self.buttonOrder)
            self.borderColor = disableStyleCalculator.calculateDisableBorderColor(buttonOrder: self.buttonOrder)
        }
        
        return self
    }
    
    var title = "Secondary Button"
    //TODO: HighlightColor isn't needed
    var backgroundColor: UIColor? = nil
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = nil
    
    var titleColor: UIColor = BrandSecondaryButtonColors.secondarySuccessTitleColor
    
    var leadingIcon: UIImage? = nil
    
    var trailingIcon: UIImage? = nil
    
    var iconColor: UIColor? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .Secoundary
    
    var buttonType: BrandButtonType = .successButton
}
