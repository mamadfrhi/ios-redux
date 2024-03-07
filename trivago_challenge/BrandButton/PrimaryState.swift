//
//  PrimaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

class PrimaryState: ButtonStateable {
    
    let primaryStyleCalculator = PrimaryButtonStyleCalculator()
    let disableStyleCalculator = BrandPrimaryButtonDisableStyleCalculator()
    
    func render(isHighlighted: Bool = false, isEnabled: Bool = true) -> ButtonStateable {
        if isEnabled {
            self.backgroundColor = primaryStyleCalculator.calculateBackColor(buttonType: self.buttonType,
                                                                             buttonOrder: self.buttonOrder,
                                                                             isHighlighted: isHighlighted)
            self.titleColor = primaryStyleCalculator.calculateTitleColor(buttonType: self.buttonType,
                                                                         buttonOrder: self.buttonOrder,
                                                                         isHighlighted: isHighlighted)
            self.titleHighlightColor = primaryStyleCalculator.calculateTitleHighlightColor(buttonType: self.buttonType,
                                                                                           buttonOrder: self.buttonOrder,
                                                                                           isHighlighted: isHighlighted)
        } else {
            self.backgroundColor = disableStyleCalculator.calculateDisableBackgroundColor()
            self.titleColor = disableStyleCalculator.calculateDisableTitleColor()
            self.borderColor = disableStyleCalculator.calculateDisableTitleColor()
        }
        return self
    }
    
    var title = "Primary Pressed"
    
    var backgroundColor: UIColor? = BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
    
    var titleColor: UIColor = .white
    
    var leadingIcon: UIImage? = nil
    
    var trailingIcon: UIImage? = nil
    
    var iconColor: UIColor? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .Primary
    
    var buttonType: BrandButtonType = .successButton
}
