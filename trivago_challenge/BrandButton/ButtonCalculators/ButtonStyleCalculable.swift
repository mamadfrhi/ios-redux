//
//  BrandButtonStyleCalculable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

protocol ButtonStyleCalculable {
    
    func calculateBackColor(buttonType: BrandButtonType,
                            buttonOrder: BrandButtonOrder,
                            isHighlighted: Bool) -> UIColor?
    
    func calculateTitleColor(buttonType: BrandButtonType,
                             buttonOrder: BrandButtonOrder,
                             isHighlighted: Bool) -> UIColor
    
    func calculateTitleHighlightColor(buttonType: BrandButtonType,
                                      buttonOrder: BrandButtonOrder,
                                      isHighlighted: Bool) -> UIColor?
    
    func calculateBorderColor(buttonType: BrandButtonType,
                              buttonOrder: BrandButtonOrder) -> UIColor?
}
