//
//  ButtonAction.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

enum ButtonAction {
    case setTitle(String)
    case setDisableStyle(isDisabled: Bool)
    case setHighlight(isHighlighted: Bool)
    case setButtonOrder(buttonOrder: BrandButtonOrder)
    case setButtonType(buttonType: BrandButtonType)
    case setIcon(brandButtonIcon: BrandButtonIcon)
}

extension ButtonAction {
    var displayName: String {
        switch self {
        case .setDisableStyle(let isDisabled):
            return "setDisableStyle: \(isDisabled)"
        case .setHighlight(let isHighlighted):
            return "setHighlight: \(isHighlighted)"
        case .setTitle(let title):
            return "setTitle: \(title)"
        case .setButtonOrder(let buttonOrder):
            return "setButtonOrder: \(buttonOrder)"
        case .setButtonType(let buttonType):
            return "setButtonType: \(buttonType)"
        case .setIcon(let brandButtonIcon):
            return "setIcon: \(brandButtonIcon.iconName) AT \(brandButtonIcon.iconPosition)"
        }
    }
}
