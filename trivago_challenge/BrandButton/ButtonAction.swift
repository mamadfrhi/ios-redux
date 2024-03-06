//
//  ButtonAction.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

enum ButtonAction {
    case setBackgroundColor
    case setEnabled(Bool)
    case setHighlighted(Bool)
    case setTitle(String)
    case setOrder(BrandButtonOrder)
    case setIcon(String?, BrandButtonIconPosition, iconColor: UIColor)
}


enum BrandButtonOrder {
    case Primary
    case Secoundary
}

enum BrandButtonIconPosition {
    case left, right
}
