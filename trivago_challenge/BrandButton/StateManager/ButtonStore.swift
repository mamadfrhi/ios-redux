//
//  ButtonStore.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//


class ButtonStore {
    
    private var state: ButtonStateable
    private let reducer: ButtonReducer
    
    init(initialState: ButtonStateable, reducer: @escaping ButtonReducer) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func dispatch(action: ButtonAction) {
        state = reducer(state, action)
    }
    
    func configureInitialButtonState() {
        dispatch(action: .setHighlight(isHighlighted: false))
    }
}
