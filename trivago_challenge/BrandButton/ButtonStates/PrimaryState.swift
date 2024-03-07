//
//  PrimaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

//TODO: try to make it struct
class PrimaryState: ButtonStateable {
    
    let primaryStyleCalculator = PrimaryButtonStyleCalculator()
    let disableStyleCalculator = ButtonDisableStyleCalculator()
    
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
            self.backgroundColor = disableStyleCalculator.calculateDisableBackgroundColor(buttonOrder: self.buttonOrder)
            self.titleColor = disableStyleCalculator.calculateDisableTitleColor(buttonOrder: self.buttonOrder)
            self.borderColor = disableStyleCalculator.calculateDisableBorderColor(buttonOrder: self.buttonOrder)
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
