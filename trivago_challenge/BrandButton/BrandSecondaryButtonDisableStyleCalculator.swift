//
//  BrandButtonEnableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct BrandSecondaryButtonDisableStyleCalculator: BrandButtonSecondaryDisableStyleCalculable {
    
    func calculateEnableBorderColor(buttonType: BrandButtonType) -> UIColor? { .gray }
    
    func calculateEnableBackgroundColor() -> UIColor? { nil }
    
    func calculateEnableTitleColor(buttonType: BrandButtonType) -> UIColor { .gray }
    
    
}
