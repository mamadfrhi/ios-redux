//
//  trivago_challengeTests.swift
//  trivago_challengeTests
//
//  Created by Mohammad Farrahi on 09.03.24.
//

import SnapshotTesting
import XCTest
@testable import trivago_challenge

class PrimaryButtonTests: XCTestCase {
    
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
        
        self.vm = ButtonViewModel(initialState: PrimaryState(),
                                 primaryRenderer: primaryButtonRenderer,
                                 secondaryRenderer: secondaryButtonRenderer)
        self.vc = ViewController(viewModel: vm)
        self.vc.viewDidLayoutSubviews()
        self.vm.dispatch(.setHighlight(isHighlighted: false))
    }
    
    func testPrimarySuccess() {
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessTitleUpdate() {
        vm?.dispatch(.setTitle("TEST"))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessTrailingIcon() {
        vm?.dispatch(.setIcon(brandButtonIcon: .init(iconPosition: .trailing)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessLeadingIcon() {
        vm.dispatch(.setIcon(brandButtonIcon: .init(iconPosition: .leading)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessHighlighted() {
        vm.dispatch(.setHighlight(isHighlighted: true))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessTypeUpdate() {
        vm.dispatch(.setButtonType(buttonType: .actionButton))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessOrderUpdate() {
        vm.dispatch(.setButtonOrder(buttonOrder: .secoundary))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessDisableState() {
        vm.dispatch(.setDisableStyle(isDisabled: true))
        assertSnapshot(of: vc, as: .image)
    }
}

