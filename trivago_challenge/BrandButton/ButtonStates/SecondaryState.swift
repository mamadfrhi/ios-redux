//
//  SecondaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct SecondaryState: ButtonStateable {
    
    var title = "Secondary Button"

    var backgroundColor: UIColor? = nil
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = nil
    
    var titleColor: UIColor =
        BrandSecondaryButtonColors.secondarySuccessTitleColor
    
    var iconName: String? = nil
    
    var iconColor: UIColor? = nil
    
    var iconImage: UIImage?  = nil
    
    var iconPosition: BrandButtonIconPosition? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .secoundary
    
    var buttonType: BrandButtonType = .successButton
}
