//
//  SecondaryButtonStyleCalculator.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import UIKit

struct SecondaryButtonStyleCalculator: ButtonStyleCalculable {
    
    func calculateBackColor(buttonType: BrandButtonType,
                            buttonOrder: BrandButtonOrder,
                            isHighlighted: Bool) -> UIColor? {
        
        let backgroundColor: UIColor?
        switch buttonType {
        case .successButton:
            backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondarySuccessHighlightedColor : nil
        case .actionButton:
            backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondaryActionHighlightedColor : nil
        }
        
        return backgroundColor
    }
    
    func calculateTitleColor(buttonType: BrandButtonType,
                             buttonOrder: BrandButtonOrder,
                             isHighlighted: Bool) -> UIColor {
        
        switch buttonType {
        case .successButton:
            return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        case .actionButton:
            return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        }
    }
    
    func calculateTitleHighlightColor(buttonType: BrandButtonType,
                                      buttonOrder: BrandButtonOrder,
                                      isHighlighted: Bool) -> UIColor? {
        
        var titleHighlightColor: UIColor?
        
        switch buttonType {
        case .successButton:
            titleHighlightColor = isHighlighted ? BrandPrimaryButtonColors.primarySuccessButtonHighlightColor : BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        case .actionButton:
            titleHighlightColor = isHighlighted ? BrandPrimaryButtonColors.primaryActionButtonHighlightColor : BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        }
        
        
        return titleHighlightColor
    }
    
    func calculateBorderColor(buttonType: BrandButtonType,
                              buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonType {
        case .successButton:
            return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        case .actionButton:
            return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        }
    }
    
}
