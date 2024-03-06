//
//  BrandButtonDisableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol BrandButtonDisableStyleCalculable {
    func calculateDisableBorderColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor?
    func calculateDisableBackgroundColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor?
    func calculateDisableTitleColor(buttonType: BrandButtonType, buttonOrder: BrandButtonOrder) -> UIColor
}
