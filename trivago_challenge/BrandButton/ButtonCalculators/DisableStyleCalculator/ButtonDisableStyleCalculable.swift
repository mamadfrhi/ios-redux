//
//  BrandButtonEnableStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol ButtonDisableStyleCalculable {
    func calculateDisableBackgroundColor(buttonOrder: BrandButtonOrder) -> UIColor?
    func calculateDisableTitleColor(buttonOrder: BrandButtonOrder) -> UIColor
    func calculateDisableBorderColor(buttonOrder: BrandButtonOrder) -> UIColor?
}
