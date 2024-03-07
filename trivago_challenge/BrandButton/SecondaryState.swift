//
//  SecondaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

class SecondaryState: ButtonStateable {
    
    let normalStyleCalculator = SecondaryButtonStyleCalculator()
    let disableStyleCalculator = BrandSecondaryButtonDisableStyleCalculator()
    
    func render(isHighlighted: Bool = false, isEnabled: Bool = true) -> ButtonStateable {
        if isEnabled {
            self.backgroundColor = normalStyleCalculator.calculateBackColor(buttonType: self.buttonType,
                                                                      buttonOrder: self.buttonOrder,
                                                                      isHighlighted: isHighlighted)
            self.titleColor = normalStyleCalculator.calculateTitleColor(buttonType: self.buttonType,
                                                                  buttonOrder: self.buttonOrder,
                                                                  isHighlighted: isHighlighted)
            self.titleHighlightColor = normalStyleCalculator.calculateTitleHighlightColor(buttonType: self.buttonType,
                                                                                    buttonOrder: self.buttonOrder,
                                                                                    isHighlighted: isHighlighted)
            self.borderColor = normalStyleCalculator.calculateBorderColor(buttonType: self.buttonType, buttonOrder: self.buttonOrder)
        } else {
            self.backgroundColor = disableStyleCalculator.calculateEnableBackgroundColor()
            self.titleColor = disableStyleCalculator.calculateEnableTitleColor(buttonType: self.buttonType)
            self.borderColor = disableStyleCalculator.calculateEnableBorderColor(buttonType: self.buttonType)
        }
        
        return self
    }
    
    var title = "Secondary Button"
    //TODO: HighlightColor isn't needed
    var backgroundColor: UIColor? = BrandSecondaryButtonColors.secondarySuccessButtonHighlightColor
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = nil
    
    var titleColor: UIColor = BrandSecondaryButtonColors.secondarySuccessButtonHighlightColor
    
    var leadingIcon: UIImage? = nil
    
    var trailingIcon: UIImage? = nil
    
    var iconColor: UIColor? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .Secoundary
    
    var buttonType: BrandButtonType = .actionButton
}
