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
        brandButton.updateAppearance(state: PrimaryState())
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
    }
    
    private func bindViewModel() {
        viewModel.stateDidChange = { [weak self] state in
            self?.brandButton.updateAppearance(state: state)
        }
    }
    
    @objc private func brandButtonTouchedDown() {
        viewModel.dispatch(.setHighlight(isHighlighted: true))
        print("Brand Button has been tapped!")
    }
    
    @objc private func brandButtonTouchUpInside() {
        viewModel.dispatch(.setHighlight(isHighlighted: false))
    }
}
