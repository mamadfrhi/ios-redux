//
//  BrandButtonRepresentable.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 10.03.24.
//

import SwiftUI
import UIKit

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

// BrandButtonView.swift
struct BrandButtonView: View {
    @ObservedObject var viewModel: ButtonViewModel
    
    var body: some View {
        BrandButtonRepresentable(viewModel: viewModel)
            .frame(width: 175, height: 44)
            .onAppear {
                viewModel.dispatch(.setHighlight(isHighlighted: false))
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in viewModel.dispatch(.setHighlight(isHighlighted: true)) }
                    .onEnded { _ in viewModel.dispatch(.setHighlight(isHighlighted: false)) }
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 5)
                    .onEnded { _ in
                        if viewModel.buttonStore!.state.buttonType == .successButton {
                            viewModel.dispatch(.setButtonType(buttonType: .actionButton))
                        } else {
                            viewModel.dispatch(.setButtonType(buttonType: .successButton))
                        }
                    }
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 50)
                    .onEnded { _ in
                        if viewModel.buttonStore!.state.iconPosition == nil {
                            viewModel.dispatch(.setIcon(brandButtonIcon: BrandButtonIcon(iconPosition: .leading)))
                            return
                        }
                        if viewModel.buttonStore!.state.iconPosition == .trailing {
                            viewModel.dispatch(.setIcon(brandButtonIcon: BrandButtonIcon(iconPosition: .leading)))
                        } else {
                            viewModel.dispatch(.setIcon(brandButtonIcon: BrandButtonIcon(iconPosition: .trailing)))
                        }
                        
                    }
            )
    }
}
