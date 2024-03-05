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
    
    func updateAppearance(state: ButtonState) {
        setTitle(state.title, for: .normal)
        setTitleColor(state.titleColor, for: .normal)
        backgroundColor = state.backgroundColor
        setImage(state.leadingIcon, for: .normal)
        isEnabled = state.isEnabled
        alpha = state.isHighlighted ? 0.5 : 1.0
    }
}
