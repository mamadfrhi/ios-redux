//
//  ButtonAction.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

enum ButtonAction {
    case setBackgroundColor
    case setDisableStyle(BrandButtonDisableStyleCalculable)
    case setEnableStyle(BrandButtonEnableStyleCalculable)
    case setHighlight(backgroundColor: UIColor?, titleColor: UIColor, titleHighlightColor: UIColor?)
    case setTitle(String)
    case setOrder(BrandButtonOrder, BrandButtonStyleCalculable)
    case setIcon(String?, BrandButtonIconPosition, iconColor: UIColor)
}


enum BrandButtonOrder {
    case Primary
    case Secoundary
}

enum BrandButtonIconPosition {
    case left, right
}
