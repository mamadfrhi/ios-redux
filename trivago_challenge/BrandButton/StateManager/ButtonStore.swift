//
//  ButtonStore.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//


class ButtonStore {
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
}
