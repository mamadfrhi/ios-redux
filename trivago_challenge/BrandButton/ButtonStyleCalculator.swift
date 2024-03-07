//
//  ButtonStyleCalculator.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol ButtonStyleCalculable {
    func calculateBackColor(isHighlighted: Bool) -> UIColor?
    func calculateTitleColor(isHighlighted: Bool) -> UIColor
    func calculateBorderColor() -> UIColor?
    func calculateTitleHighlightColor(isHighlighted: Bool) -> UIColor?
}

struct PrimaryButtonStyleCalculator: BrandButtonStyleCalculable {
    
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
        
        
        //        case .Secoundary:
        //            switch buttonType {
        //            case .successButton:
        //                backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondarySuccessButtonHighlightColor : nil
        //            case .actionButton:
        //                backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondaryActionButtonHighlightColor : nil
        //            }
        //        }
        
        return backgroundColor
    }
    
    func calculateTitleHighlightColor(buttonType: BrandButtonType,
                                      buttonOrder: BrandButtonOrder,
                                      isHighlighted: Bool) -> UIColor? {
        
        //        case .Secoundary:
        //            switch buttonType {
        //            case .successButton:
        //                titleHighlightColor = isHighlighted ? .red : BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        //            case .actionButton:
        //                titleHighlightColor = isHighlighted ? BrandPrimaryButtonColors.primaryActionButtonHighlightColor :         BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        //            }
        
        
        return .white
    }
    
    func calculateTitleColor(buttonType: BrandButtonType,
                             buttonOrder: BrandButtonOrder,
                             isHighlighted: Bool
    ) -> UIColor {
        return .white
        //        switch buttonOrder {
        //        case .Primary:
        //            return .white
        //        case .Secoundary:
        //            if isHighlighted {
        //                switch buttonType {
        //                case .successButton:
        //                    return BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
        //                case .actionButton:
        //                    return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        //                }
        //            } else {
        //                switch buttonType {
        //                case .successButton:
        //                    return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        //                case .actionButton:
        //                    return BrandPrimaryButtonColors.primaryActionButtonHighlightColor
        //                }
        //            }
        //
        //        }
    }
    
    func calculateBorderColor(buttonType: BrandButtonType,
                              buttonOrder: BrandButtonOrder) -> UIColor? {
        return nil
        //        switch buttonOrder {
        //        case .Primary:
        //            return nil
        //        case .Secoundary:
        //            switch buttonType {
        //            case .successButton:
        //                return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        //            case .actionButton:
        //                return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        //            }
        //        }
    }
    
    
}

struct SecondaryButtonStyleCalculator: BrandButtonStyleCalculable {
    
    func calculateBackColor(buttonType: BrandButtonType,
                            buttonOrder: BrandButtonOrder,
                            isHighlighted: Bool) -> UIColor? {
        
        let backgroundColor: UIColor?
        switch buttonType {
        case .successButton:
            backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondarySuccessButtonHighlightColor : nil
        case .actionButton:
            backgroundColor = isHighlighted ? BrandSecondaryButtonColors.secondaryActionButtonHighlightColor : nil
        }
        
        return backgroundColor
    }
    
    func calculateTitleHighlightColor(buttonType: BrandButtonType,
                                      buttonOrder: BrandButtonOrder,
                                      isHighlighted: Bool) -> UIColor? {
        
        var titleHighlightColor: UIColor?
        switch buttonType {
        case .successButton:
            titleHighlightColor = isHighlighted ? .red : BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        case .actionButton:
            titleHighlightColor = isHighlighted ? BrandPrimaryButtonColors.primaryActionButtonHighlightColor :         BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
        }
        
        
        return titleHighlightColor
    }
    
    func calculateTitleColor(buttonType: BrandButtonType,
                             buttonOrder: BrandButtonOrder,
                             isHighlighted: Bool
    ) -> UIColor {
        
        switch buttonType {
        case .successButton:
            return BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
        case .actionButton:
            return BrandPrimaryButtonColors.primaryActionButtonHighlightColor
        }
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
