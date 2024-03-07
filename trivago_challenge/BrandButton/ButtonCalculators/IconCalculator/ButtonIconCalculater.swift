//
//  BrandButtonIconCalculater.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 06.03.24.
//

import UIKit

struct ButtonIconCalculater : ButtonIconCalculable {
    func calculateBrandButtonIcon(iconName: String?, buttonOrder: BrandButtonOrder) -> UIImage? {
        
        guard let iconName = iconName else { return nil }
        var iconImage : UIImage?
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium)
        
        switch buttonOrder {
        case .Primary:
            iconImage = UIImage(systemName: iconName, withConfiguration: largeConfig)?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.white)
        case .Secoundary:
            iconImage = UIImage(systemName: iconName, withConfiguration: largeConfig)?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.black)
        }
        
        return iconImage
    }
}

