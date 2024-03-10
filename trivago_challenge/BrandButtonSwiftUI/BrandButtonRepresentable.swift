//
//  BrandButtonRepresentable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 10.03.24.
//

import SwiftUI
import UIKit

struct BrandButtonRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: ButtonViewModel
    
    
    func makeUIView(context: Context) -> BrandButton {
        let brandButton = BrandButton()
        return brandButton
    }
    
    func updateUIView(_ uiView: BrandButton, context: Context) {
        viewModel.stateDidChange = { state in
            uiView.updateAppearance(state: state)
        }
        uiView.updateAppearance(state: viewModel.buttonStore!.state)
    }
}
