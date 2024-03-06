//
//  ButtonState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

struct ButtonState {
    var title: String
    var backgroundColor: UIColor?
    var borderColor: UIColor?
    var titleHighlightColor: UIColor?
    var titleColor: UIColor
    var leadingIcon: UIImage?
    var trailingIcon: UIImage?
    var iconColor: UIColor?
    var isEnabled: Bool
    var isHighlighted: Bool
    var buttonOrder: BrandButtonOrder
    var buttonType: BrandButtonType
}

enum BrandButtonType {
    case successButton, actionButton
}
