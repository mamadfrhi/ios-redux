//
//  BrandButtonRenderable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import Foundation

protocol BrandButtonRenderable {
    var styleCalculator: ButtonStyleCalculable { get set }
    var disableStyleCalculator: ButtonDisableStyleCalculable { get set }
    
    func render(buttonState: ButtonStateable) -> ButtonStateable
}
