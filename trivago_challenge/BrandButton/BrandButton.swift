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
        
        var state = state
        if state.isEnabled {
            state = setEnableStyle(state: store!.state)
        } else {
            state = setDisableStyle(state: store!.state)
        }
        
        setTitleColor(state.titleColor, for: .normal)
        backgroundColor = state.backgroundColor
        layer.borderWidth = state.buttonOrder == .Secoundary ? 1 : 0
        layer.borderColor = state.borderColor?.cgColor
        
        
        set(leadingIcon: state.leadingIconName, trailingIcon: state.trailingIconName, iconColor: state.iconColor)
        
        let inset: CGFloat = 10
        contentEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        sizeToFit()
    }
    
    private func setDisableStyle(state: ButtonState) -> ButtonState {
        var state = state
        self.disableStyleCalculator = BrandButtonDisableStyleCalculator()
        state.backgroundColor = disableStyleCalculator?.calculateDisableBackgroundColor(buttonType: state.buttonType,
                                                                                       buttonOrder: state.buttonOrder)
        state.borderColor = disableStyleCalculator?.calculateDisableBorderColor(buttonType: state.buttonType,
                                                                                       buttonOrder: state.buttonOrder)
        state.titleColor = disableStyleCalculator!.calculateDisableTitleColor(buttonType: state.buttonType,
                                                                                          buttonOrder: state.buttonOrder)
        self.isEnabled = false
        return state
    }
    
    private func setEnableStyle(state: ButtonState) -> ButtonState {
        var state = state
        self.disableStyleCalculator = BrandButtonDisableStyleCalculator()
        state.backgroundColor = .red
        state.borderColor = .blue
        state.titleColor = .white
        self.isEnabled = true
        return state
    }
    
    private func set(leadingIcon: String?, trailingIcon: String?, iconColor: UIColor?) {
        
        guard let iconColor = iconColor else { return }
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium)
        
        if let leadingIcon = leadingIcon {
            guard let image = UIImage(systemName: leadingIcon, withConfiguration: largeConfig)?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(iconColor) else { return }
            
            setImage(image, for: .normal)
            imageView!.contentMode = .center
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            
        } else if let trailingIcon = trailingIcon {
            
            guard let image = UIImage(systemName: trailingIcon, withConfiguration: largeConfig)?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(iconColor) else { return }
            
            setImage(image, for: .normal)
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        
        titleLabel?.lineBreakMode = .byTruncatingTail
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.1
        
        sizeToFit()
    }
}
