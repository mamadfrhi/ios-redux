//
//  BrandButtonIcon.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import UIKit

struct BrandButtonIcon: BrandButtonIconProtocol {
    
    var iconCalculator: ButtonIconCalculable =  ButtonIconCalculater()
    
    var iconName: String = "square.fill"
    var iconPosition: BrandButtonIconPosition
    
    func render(buttonOrder: BrandButtonOrder) -> UIImage? {
        return iconCalculator.calculateBrandButtonIcon(iconName: iconName, buttonOrder: buttonOrder) ?? nil
    }
}
