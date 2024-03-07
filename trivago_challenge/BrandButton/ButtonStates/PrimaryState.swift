//
//  PrimaryState.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit



//TODO: try to make it struct


class PrimaryState: ButtonStateable {

    var title = "Primary Pressed"
    
    var backgroundColor: UIColor? = BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
    
    var borderColor: UIColor? = nil
    
    var titleHighlightColor: UIColor? = BrandPrimaryButtonColors.primarySuccessButtonHighlightColor
    
    var titleColor: UIColor = .white
    
    var leadingIcon: UIImage? = nil
    
    var trailingIcon: UIImage? = nil
    
    var iconColor: UIColor? = nil
    
    var isEnabled = true
    
    var isHighlighted = false
    
    var buttonOrder: BrandButtonOrder = .Primary
    
    var buttonType: BrandButtonType = .successButton
}
