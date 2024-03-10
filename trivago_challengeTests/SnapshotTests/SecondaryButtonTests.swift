//
//  SecondaryButtonTests.swift
//  trivago_challengeTests
//
//  Created by Mohammad Farrahi on 09.03.24.
//

import XCTest
import SnapshotTesting
@testable import trivago_challenge

final class SecondaryButtonTests: XCTestCase {
    
    var vm: ButtonViewModel!
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        let primaryButtonRenderer = PrimaryButtonRenderer(styleCalculator: PrimaryButtonStyleCalculator(),
                                                          disableStyleCalculator: ButtonDisableStyleCalculator(),
                                                          iconCalculator: PrimaryButtonIconCalculater())
        let secondaryButtonRenderer = SecondaryButtonRenderer(styleCalculator: SecondaryButtonStyleCalculator(),
                                                              disableStyleCalculator: ButtonDisableStyleCalculator(),
                                                              iconCalculator: SecondaryButtonIconCalculater())
        self.vm = ButtonViewModel(initialState: SecondaryState(),
                                  primaryRenderer: primaryButtonRenderer,
                                  secondaryRenderer: secondaryButtonRenderer)
        self.vc = ViewController(viewModel: vm!)
        self.vc.viewDidLayoutSubviews()
        self.vm.dispatch(.setHighlight(isHighlighted: false))
    }
    
    func testSecondarySuccess() {
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessTitleUpdate() {
        vm.dispatch(.setTitle("TEST"))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessTrailingIcon() {
        vm.dispatch(.setIcon(brandButtonIcon: .init(iconPosition: .trailing)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessLeadingIcon() {
        vm.dispatch(.setIcon(brandButtonIcon: .init(iconPosition: .leading)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessHighlighted() {
        vm.dispatch(.setHighlight(isHighlighted: true))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessTypeUpdate() {
        vm.dispatch(.setButtonType(buttonType: .actionButton))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessOrderUpdate() {
        vm.dispatch(.setButtonOrder(buttonOrder: .secoundary))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessDisableState() {
        vm.dispatch(.setDisableStyle(isDisabled: true))
        assertSnapshot(of: vc, as: .image)
    }
}



