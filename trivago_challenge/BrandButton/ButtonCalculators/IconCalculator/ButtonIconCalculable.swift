//
//  BrandButtonIconCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol ButtonIconCalculable {
    func calculateBrandButtonIcon(iconName: String?, buttonOrder: BrandButtonOrder) -> UIImage?
}
