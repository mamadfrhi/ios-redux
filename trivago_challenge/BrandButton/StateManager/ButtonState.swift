//
//  ButtonState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

protocol ButtonStateable {
    var title: String { get set }
    var backgroundColor: UIColor? { get set }
    var borderColor: UIColor? { get set }
    var titleHighlightColor: UIColor? { get set }
    var titleColor: UIColor { get set }
    var leadingIcon: UIImage? { get set }
    var trailingIcon: UIImage? { get set }
    var iconColor: UIColor? { get set }
    var isEnabled: Bool { get set }
    var isHighlighted: Bool { get set }
    var buttonOrder: BrandButtonOrder { get set }
    var buttonType: BrandButtonType { get set }
}

enum BrandButtonType {
    case successButton, actionButton
}
