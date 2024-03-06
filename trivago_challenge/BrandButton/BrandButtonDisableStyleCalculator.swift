//
//  BrandButtonDisableStyleCalculator.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct BrandButtonDisableStyleCalculator: BrandButtonDisableStyleCalculable {
    
    func calculateDisableBorderColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
            
        case .Primary:
            return nil
        case .Secoundary:
            return .gray
        }
    }
    
    func calculateDisableBackgroundColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
        case .Primary:
            return .gray
        case .Secoundary:
            return nil
        }
    }
    
    func calculateDisableTitleColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor {
        switch buttonOrder {
        case .Primary:
            return .white
        case .Secoundary:
            return .gray
        }
    }
    
    
}
