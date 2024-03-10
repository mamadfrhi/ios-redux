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
