//
//  ButtonAction.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

enum ButtonAction {
    case setDisableStyle(isDisabled: Bool)
    case setHighlight(isHighlighted: Bool)
    case setTitle(String)
    case setButtonOrder(buttonOrder: BrandButtonOrder)
    case setButtonType(buttonType: BrandButtonType)
    case setIcon(brandButtonIcon: BrandButtonIcon)
}
