//
//  BrandButtonEnableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct ButtonDisableStyleCalculator: ButtonDisableStyleCalculable {
    
    func calculateDisableBorderColor(buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
        case .primary:
                return nil
        case .secoundary:
            return .gray
        }
    }
    
    func calculateDisableBackgroundColor(buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
        case .primary:
            return .gray
        case .secoundary:
            return nil
        }
    }
    
    func calculateDisableTitleColor(buttonOrder: BrandButtonOrder) -> UIColor {
        switch buttonOrder {
        case .primary:
            return .white
        case .secoundary:
            return .gray
        }
    }
    
    
}
