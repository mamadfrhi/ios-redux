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
        case .Primary:
                return nil
        case .Secoundary:
            return .gray
        }
    }
    
    func calculateDisableBackgroundColor(buttonOrder: BrandButtonOrder) -> UIColor? {
        switch buttonOrder {
        case .Primary:
            return .gray
        case .Secoundary:
            return nil
        }
    }
    
    func calculateDisableTitleColor(buttonOrder: BrandButtonOrder) -> UIColor {
        switch buttonOrder {
        case .Primary:
            return .white
        case .Secoundary:
            return .gray
        }
    }
    
    
}
