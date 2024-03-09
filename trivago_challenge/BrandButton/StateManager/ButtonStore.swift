//
//  ButtonStore.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//


class ButtonStore {
    
    //TODO: Add renderers here
    
    var state: ButtonStateable {
        didSet {
            stateDidUpdate()
        }
    }
    private let reducer: ButtonReducer
    var stateDidUpdate: () -> Void = {}
    
    init(initialState: ButtonStateable, reducer: @escaping ButtonReducer) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func dispatch(action: ButtonAction) {
        state = reducer(state, action)
    }
    
    func configureInitialButtonState() {
        dispatch(action: .setHighlight(isHighlighted: false))
//        let icon = BrandButtonIcon(iconPosition: .trailing)
//        dispatch(action: .setIcon(brandButtonIcon: icon))
//        dispatch(action: .setButtonType(buttonType: .actionButton))
//        dispatch(action: .setDisableStyle(isDisabled: true))
//        dispatch(action: .setDisableStyle(isDisabled: false))
//        dispatch(action: .setButtonOrder(buttonOrder: .secoundary))
//        dispatch(action: .setButtonType(buttonType: .successButton))
    }
}
