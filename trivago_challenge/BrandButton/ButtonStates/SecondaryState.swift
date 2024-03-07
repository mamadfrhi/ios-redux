//
//  SecondaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

//TODO: try to make it struct
class SecondaryState: ButtonStateable {
    
    var title = "Secondary Button"

    var backgroundColor: UIColor? = nil
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = nil
    
    var titleColor: UIColor = BrandSecondaryButtonColors.secondarySuccessTitleColor
    
    var leadingIcon: UIImage? = nil
    
    var trailingIcon: UIImage? = nil
    
    var iconColor: UIColor? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .Secoundary
    
    var buttonType: BrandButtonType = .successButton
}
