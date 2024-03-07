//
//  ButtonState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

protocol ButtonStateable {
    var title: String { get }
    var backgroundColor: UIColor? { get }
    var borderColor: UIColor? { get }
    var titleHighlightColor: UIColor? { get }
    var titleColor: UIColor { get }
    var leadingIcon: UIImage? { get }
    var trailingIcon: UIImage? { get }
    var iconColor: UIColor? { get }
    var isEnabled: Bool { get }
    var isHighlighted: Bool { get }
    var buttonOrder: BrandButtonOrder { get }
    var buttonType: BrandButtonType { get }
    
    func render(isHighlighted: Bool, isEnabled: Bool) -> ButtonStateable
}

enum BrandButtonType {
    case successButton, actionButton
}
