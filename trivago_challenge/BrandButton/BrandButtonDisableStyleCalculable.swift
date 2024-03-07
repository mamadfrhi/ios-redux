//
//  BrandButtonDisableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol BrandPrimaryButtonDisableStyleCalculable {
    func calculateDisableBorderColor() -> UIColor?
    func calculateDisableBackgroundColor() -> UIColor?
    func calculateDisableTitleColor() -> UIColor
}
