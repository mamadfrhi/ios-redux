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
            
            guard let state = store?.state else { return }
            let styleCalculator = ButtonStyleCalculator()
            let backColor = styleCalculator.calculateBackColor(buttonType: state.buttonType,
                                                               buttonOrder: state.buttonOrder,
                                                               isHighlighted: isHighlighted)
            let titleColor = styleCalculator.calculateTitleColor(buttonType: state.buttonType,
                                                                 buttonOrder: state.buttonOrder,
                                                                 isHighlighted: isHighlighted)
            let titleHighlightColor = styleCalculator.calculateTitleHighlightColor(buttonType: state.buttonType,
                                                                                   buttonOrder: state.buttonOrder,
                                                                                   isHighlighted: isHighlighted)
            store?.dispatch(action: .setHighlight(backgroundColor: backColor,
                                                  titleColor: titleColor,
                                                  titleHighlightColor: titleHighlightColor))
        }
    }
    
    private func updateAppearance(state: ButtonState) {
        setTitle(state.title, for: .normal)
        layer.cornerRadius = 5
        self.isEnabled = state.isEnabled
        setTitleColor(state.titleColor, for: .normal)
        backgroundColor = state.backgroundColor
        
        
        setBorderColor(with: state)
        set(leadingIcon: state.leadingIcon,
            trailingIcon: state.trailingIcon)
        set(insetValue: 10)
        set(font: UIFont.systemFont(ofSize: 17, weight: .medium))
        
        sizeToFit()
    }
    
    private func setBorderColor(with state: ButtonState) {
        layer.borderWidth = state.buttonOrder == .Secoundary ? 1 : 0
        layer.borderColor = state.borderColor?.cgColor
    }
    
    private func set(insetValue: CGFloat) {
        contentEdgeInsets = UIEdgeInsets(top: insetValue, left: insetValue, bottom: insetValue, right: insetValue)
    }
    
    private func set(font: UIFont) {
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    private func set(leadingIcon: UIImage?, trailingIcon: UIImage?) {
        
        var iconImage: UIImage?
        
        if let leadingIcon = leadingIcon {
            iconImage = leadingIcon
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            
        } else if let trailingIcon = trailingIcon {
            iconImage = trailingIcon
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
