//
//  BrandButton.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

class BrandButton: UIButton {
    
    var store: ButtonStore?
    
    init(store: ButtonStore) {
        super.init(frame: .zero)
        self.store = store
        self.store?.stateDidUpdate = { [weak self] in
            self?.updateAppearance(state: store.state)
        }
        self.updateAppearance(state: store.state)
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton() {
        print("The button has been tapped!")
        
    }
    
    override var isHighlighted: Bool {
        didSet {
//            store.state.isHighlighted = self.isHighlighted
            store?.dispatch(action: .setHighlight(isHighlighted: isHighlighted))
        }
    }
    
    private func updateAppearance(state: ButtonStateable) {
        setTitle(state.title, for: .normal)
        layer.cornerRadius = 5
        self.isEnabled = state.isEnabled
        
        UIView.animate(withDuration: 0.25) {
            self.setTitleColor(state: state, isHighlighted: state.isHighlighted)
            self.backgroundColor = state.backgroundColor
        }
        
        
        setBorderColor(with: state)
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
    
    private func setBorderColor(with state: ButtonStateable) {
        layer.borderWidth = state.buttonOrder == .Secoundary ? 1 : 0
        layer.borderColor = state.borderColor?.cgColor
    }
    
    private func set(insetValue: CGFloat) {
        contentEdgeInsets = UIEdgeInsets(top: insetValue, left: insetValue, bottom: insetValue, right: insetValue)
    }
    
    private func set(font: UIFont) {
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    private func set(iconPosition: BrandButtonIconPosition?, iconImage: UIImage?) {
        
        if iconPosition == .left {
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
