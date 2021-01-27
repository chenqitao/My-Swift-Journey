//
//  BlurViewTests.swift
//  SwiftUIBlurViewTests
//
//  Created by Daniel Saidi on 2019-08-30.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import XCTest
@testable import SwiftUIBlurView

final class SwiftUIBlurViewTests: XCTestCase {
    
    func testVisualEffectViewIsCorrectlyAdded() {
        let view = BlurView(style: .dark)
        let uiview = view.createView()
        let blur = uiview.subviews.first { $0 is UIVisualEffectView }
        XCTAssertNotNil(blur, "View adds visual effect subview")
    }
}
