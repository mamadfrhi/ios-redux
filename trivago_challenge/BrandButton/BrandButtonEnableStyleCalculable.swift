//
//  BrandButtonEnableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol BrandButtonEnableStyleCalculable {
    func calculateEnableBorderColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor?
    func calculateEnableBackgroundColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor?
    func calculateEnableTitleColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor
}
