//
//  ButtonStyleCalculator.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct PrimaryButtonStyleCalculator: ButtonStyleCalculable {
    
    func calculateBackColor(buttonType: BrandButtonType,
                            buttonOrder: BrandButtonOrder,
                            isHighlighted: Bool) -> UIColor? {
        
        let backgroundColor: UIColor?
        switch buttonType {
        case .successButton:
            backgroundColor = isHighlighted ? BrandPrimaryButtonColors.primarySuccessButtonHighlightColor : BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        case .actionButton:
            backgroundColor = isHighlighted ? BrandPrimaryButtonColors.primaryActionButtonHighlightColor : BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        }
        
        return backgroundColor
    }
    
    func calculateTitleHighlightColor(buttonType: BrandButtonType,
                                      buttonOrder: BrandButtonOrder,
                                      isHighlighted: Bool) -> UIColor? {
        return .white
    }
    
    func calculateTitleColor(buttonType: BrandButtonType,
                             buttonOrder: BrandButtonOrder,
                             isHighlighted: Bool
    ) -> UIColor {
        return .white
    }
    
    func calculateBorderColor(buttonType: BrandButtonType,
                              buttonOrder: BrandButtonOrder) -> UIColor? {
        return nil
    }
    
    
}

