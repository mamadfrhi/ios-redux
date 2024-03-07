//
//  BrandButtonIconProtocol.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import UIKit

protocol BrandButtonIconProtocol {
    var iconCalculator: ButtonIconCalculable { get set }
    var iconName: String { get set }
    var iconPosition: BrandButtonIconPosition { get set }
    func render(buttonOrder: BrandButtonOrder) -> UIImage?
}
