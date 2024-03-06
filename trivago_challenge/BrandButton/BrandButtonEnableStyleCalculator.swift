//
//  BrandButtonEnableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct BrandButtonEnableStyleCalculator: BrandButtonEnableStyleCalculable {
    
    func calculateEnableBorderColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
            
        case .Primary:
            return nil
        case .Secoundary:
            switch buttonType {
            case .successButton:
                return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
            case .actionButton:
                return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
            }
        }
    }
    
    func calculateEnableBackgroundColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
        case .Primary:
            return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
        case .Secoundary:
            return nil
        }
    }
    
    func calculateEnableTitleColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor {
        switch buttonOrder {
        case .Primary:
            return .white
        case .Secoundary:
            switch buttonType {
            case .successButton:
                return BrandPrimaryButtonColors.primarySuccessButtonBackgroundColor
            case .actionButton:
                return BrandPrimaryButtonColors.primaryActionButtonBackgroundColor
            }
        }
    }
    
    
}
