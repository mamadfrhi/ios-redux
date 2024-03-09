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
    
    var vc = ViewController(primaryRenderer: PrimaryButtonRenderer(),
                            secondaryRenderer: SecondaryButtonRenderer())
    
    override func setUp() {
        super.setUp()
        vc.brandButton.store?.dispatch(action: .setButtonOrder(buttonOrder: .secoundary))
    }
    
    func testSecondarySuccess() {
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessTitleUpdate() {
        vc.brandButton.store?.dispatch(action: .setTitle("TEST"))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessTrailingIcon() {
        vc.brandButton.store?.dispatch(action: .setIcon(brandButtonIcon: .init(iconPosition: .trailing)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessLeadingIcon() {
        vc.brandButton.store?.dispatch(action: .setIcon(brandButtonIcon: .init(iconPosition: .leading)))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessHighlighted() {
        vc.brandButton.store?.dispatch(action: .setHighlight(isHighlighted: true))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessTypeUpdate() {
        vc.brandButton.store?.dispatch(action: .setButtonType(buttonType: .actionButton))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessOrderUpdate() {
        vc.brandButton.store?.dispatch(action: .setButtonOrder(buttonOrder: .secoundary))
        assertSnapshot(of: vc, as: .image)
    }
    
    func testSecondarySuccessDisableState() {
        vc.brandButton.store?.dispatch(action: .setDisableStyle(isDisabled: true))
        assertSnapshot(of: vc, as: .image)
    }
}



