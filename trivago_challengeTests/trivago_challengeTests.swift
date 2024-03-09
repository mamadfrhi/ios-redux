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
    
    let vc = ViewController(primaryRenderer: PrimaryButtonRenderer(),
                            secondaryRenderer: SecondaryButtonRenderer())
    
    func testPrimarySuccess() {
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessTitleUpdate() {
        vc.brandButton.store?.dispatch(action: .setTitle("TEST"))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessTrailingIcon() {
        vc.brandButton.store?.dispatch(action: .setIcon(brandButtonIcon: .init(iconPosition: .trailing)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessLeadingIcon() {
        vc.brandButton.store?.dispatch(action: .setIcon(brandButtonIcon: .init(iconPosition: .leading)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessHighlighted() {
        vc.brandButton.store?.dispatch(action: .setHighlight(isHighlighted: true))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessTypeUpdate() {
        vc.brandButton.store?.dispatch(action: .setButtonType(buttonType: .actionButton))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessOrderUpdate() {
        vc.brandButton.store?.dispatch(action: .setButtonOrder(buttonOrder: .secoundary))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testPrimarySuccessDisableState() {
        vc.brandButton.store?.dispatch(action: .setDisableStyle(isDisabled: true))
        assertSnapshot(of: vc, as: .image)
    }
}

