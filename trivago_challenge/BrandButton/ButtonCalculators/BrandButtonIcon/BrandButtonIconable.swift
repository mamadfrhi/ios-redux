//
//  BrandButtonIconProtocol.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import UIKit

protocol BrandButtonIconable {
    var iconName: String { get }
    var iconPosition: BrandButtonIconPosition { get set }
}
