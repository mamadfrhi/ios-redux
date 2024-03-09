//
//  PrimaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct PrimaryState: ButtonStateable {

    var title = "Primary Button"
    
    var backgroundColor: UIColor? = BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
    
    var titleColor: UIColor = .white
    
    var iconName: String? = nil
    
    var iconImage: UIImage?  = nil
    
    var iconPosition: BrandButtonIconPosition? = nil
    
    var iconColor: UIColor? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .primary
    
    var buttonType: BrandButtonType = .successButton
}
