//
//  ButtonStore.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//


class ButtonStore {
    var state: ButtonState {
        didSet {
            stateDidUpdate()
        }
    }
    private let reducer: ButtonReducer
    let styleCalculator: BrandButtonStyleCalculable
    var stateDidUpdate: () -> Void = {}
    
    init(initialState: ButtonState, reducer: @escaping ButtonReducer, styleCalculator: BrandButtonStyleCalculable) {
        self.state = initialState
        self.reducer = reducer
        self.styleCalculator = styleCalculator
    }
    
    func dispatch(action: ButtonAction) {
        state = reducer(state, action)
    }
}
