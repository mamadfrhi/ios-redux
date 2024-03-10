//
//  ViewController.swift
//  trivago_challenge
//
//  Created by Mohammad Farrahi on 05.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var brandButton: BrandButton!
    private var viewModel: ButtonViewModel
    
    private var showcaseTimer: Timer?
    private var currentActionIndex = 0
    private let actionSequence: [ButtonAction] = [
        .setHighlight(isHighlighted: true),
        .setHighlight(isHighlighted: false),
        .setTitle("Showcase Title"),
        .setDisableStyle(isDisabled: true),
        .setDisableStyle(isDisabled: false),
        .setButtonType(buttonType: .actionButton),
        .setButtonType(buttonType: .successButton),
        .setIcon(brandButtonIcon: BrandButtonIcon(iconName: "square.fill",
                                                  iconPosition: .leading)),
        .setButtonOrder(buttonOrder: .secoundary),
        .setButtonType(buttonType: .actionButton),
        .setHighlight(isHighlighted: true),
        .setHighlight(isHighlighted: false),
        .setDisableStyle(isDisabled: true),
        .setDisableStyle(isDisabled: false),
        .setIcon(brandButtonIcon: BrandButtonIcon(iconName: "square.fill",
                                                  iconPosition: .trailing)),
        
    ]
    
    init(viewModel: ButtonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBrandButton()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        brandButton.sendActions(for: .touchUpInside)
        // trig the button to appear on the VC
    }
    
    private func setupBrandButton() {
        brandButton = BrandButton()
        view.addSubview(brandButton)
        brandButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            brandButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            brandButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            brandButton.heightAnchor.constraint(equalToConstant: 44),
            brandButton.widthAnchor.constraint(equalToConstant: 175)
        ])
        
        brandButton.addTarget(self,
                              action: #selector(brandButtonTouchedDown),
                              for: .touchDown)
        brandButton.addTarget(self,
                              action: #selector(brandButtonTouchUpInside),
                              for: .touchUpInside)
        brandButton.addTarget(self,
                              action: #selector(brandButtonTouchDragOutside),
                              for: .touchDragOutside)
    }
    
    private func bindViewModel() {
        viewModel.stateDidChange = { [weak self] state in
            self?.brandButton.updateAppearance(state: state)
        }
    }
    
    @objc private func brandButtonTouchedDown() {
        viewModel.dispatch(.setHighlight(isHighlighted: true))
    }
    
    @objc private func brandButtonTouchUpInside() {
        viewModel.dispatch(.setHighlight(isHighlighted: false))
        print("Brand Button has been tapped!")
    }
    
    @objc private func brandButtonTouchDragOutside() {
        viewModel.dispatch(.setHighlight(isHighlighted: false))
        startShowcase()
    }
}


extension ViewController {
    private func startShowcase() {
        if showcaseTimer != nil { return }
        showcaseTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(showcaseNextAction), userInfo: nil, repeats: true)
    }
    
    @objc private func showcaseNextAction() {
        guard currentActionIndex < actionSequence.count else {
            showcaseTimer?.invalidate()
            showcaseTimer = nil
            currentActionIndex = 0
            print("Showcase completed.")
            return
        }
        
        let action = actionSequence[currentActionIndex]
        viewModel.dispatch(action)
        currentActionIndex += 1
    }
}
