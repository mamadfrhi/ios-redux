//
//  ButtonAction.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

enum ButtonAction {
    case setDisableStyle(buttonOrder: BrandButtonOrder)
    case setHighlight(isHighlighted: Bool)
    case setTitle(String)
    case setButtonType(BrandButtonType)
    case setIcon(BrandButtonIcon)
}


enum BrandButtonOrder {
    case Primary
    case Secoundary
}

enum BrandButtonIconPosition {
    case left, right
}
