//
//  BrandButtonDisableStyleCalculator.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct BrandPrimaryButtonDisableStyleCalculator: BrandPrimaryButtonDisableStyleCalculable {
    
    func calculateDisableBorderColor() -> UIColor? { nil }
    
    func calculateDisableBackgroundColor() -> UIColor? { .gray }
    
    func calculateDisableTitleColor() -> UIColor { .white }
    
}
