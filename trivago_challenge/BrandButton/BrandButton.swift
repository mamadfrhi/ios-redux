//
//  BrandButton.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

class BrandButton: UIButton {
    
    init() { super.init(frame: .zero) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateAppearance(state: ButtonStateable) {
        setTitle(state.title, for: .normal)
        layer.cornerRadius = 5
        self.isEnabled = state.isEnabled
        
        UIView.animate(withDuration: 0.25) {
            self.setTitleColor(state: state, isHighlighted: state.isHighlighted)
            self.backgroundColor = state.backgroundColor
        }
        
        setBorderColor(for: state)
        set(iconPosition: state.iconPosition, iconImage: state.iconImage)
        set(insetValue: 10)
        set(font: UIFont.systemFont(ofSize: 17, weight: .medium))
        
        sizeToFit()
    }
    
    private func setTitleColor(state: ButtonStateable, isHighlighted: Bool) {
        if isHighlighted {
            self.setTitleColor(state.titleHighlightColor, for: .highlighted)
        } else {
            self.setTitleColor(state.titleColor, for: .normal)
        }
    }
    
    private func setBorderColor(for state: ButtonStateable) {
        layer.borderWidth = state.buttonOrder == .secoundary ? 1 : 0
        layer.borderColor = state.borderColor?.cgColor
    }
    
    private func set(insetValue: CGFloat) {
        contentEdgeInsets = UIEdgeInsets(top: insetValue,
                                         left: insetValue,
                                         bottom: insetValue,
                                         right: insetValue)
    }
    
    private func set(font: UIFont) {
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    private func set(iconPosition: BrandButtonIconPosition?, iconImage: UIImage?) {
        
        if iconImage == nil { return }
        
        if iconPosition == .leading {
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            
        } else {
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
        
        setImage(iconImage, for: .normal)
        imageView!.contentMode = .center
        
        
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        
        titleLabel?.lineBreakMode = .byTruncatingTail
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.1
    }
}
