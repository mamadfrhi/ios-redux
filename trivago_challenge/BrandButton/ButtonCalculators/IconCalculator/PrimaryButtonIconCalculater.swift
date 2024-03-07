//
//  PrimaryButtonIconCalculater.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 07.03.24.
//

import UIKit

struct PrimaryButtonIconCalculater: ButtonIconCalculable {
    
    func calculateIcon(iconName: String?) -> UIImage? {
        
        guard let iconName = iconName else { return nil }
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24,
                                                      weight: .regular,
                                                      scale: .medium)
        
        return UIImage(systemName: iconName, withConfiguration: largeConfig)?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.white)
        
    }
}
