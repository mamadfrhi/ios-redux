//
//  BrandButtonEnableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol BrandButtonSecondaryDisableStyleCalculable {
    func calculateEnableBorderColor(buttonType: BrandButtonType) -> UIColor?
    func calculateEnableBackgroundColor() -> UIColor?
    func calculateEnableTitleColor(buttonType: BrandButtonType) -> UIColor
}
