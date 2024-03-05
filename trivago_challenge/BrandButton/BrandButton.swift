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
            self.store?.dispatch(action: .setHighlighted(isHighlighted))
        }
    }
    
    private func updateAppearance(state: ButtonState) {
        setTitle(state.title, for: .normal)
        setTitleColor(state.titleColor, for: .normal)
        set(trailingIcon: state.leadingIconName, leadingIcon: state.trailingIconName)
        isEnabled = state.isEnabled
        set(backgroundColor: state.backgroundColor, isHighlighted: state.isHighlighted)
        
        let inset: CGFloat = 10
        contentEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        sizeToFit()
    }
    
    private func set(backgroundColor: UIColor, isHighlighted: Bool) {
        let alpha = isHighlighted ? 1.0 : 0.7
        //TODO: Clean below
        self.backgroundColor = UIColor(ciColor: CIColor(color: backgroundColor)).withAlphaComponent(alpha)
    }
    
    private func set(trailingIcon: String?, leadingIcon: String?) {
        
        if let leadingIcon = leadingIcon {
            let image = UIImage(systemName: leadingIcon)
            setImage(image, for: .normal)
            semanticContentAttribute = .forceRightToLeft
        }
        
        if let trailingIcon = trailingIcon {
            let image = UIImage(systemName: trailingIcon)
            setImage(image, for: .normal)
            semanticContentAttribute = .forceLeftToRight
        }
    }
}
