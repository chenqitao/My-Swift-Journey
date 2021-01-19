//
//  PositionRowsScrollTest.swift
//  GridTests
//
//  Created by Denis Obukhov on 13.05.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import XCTest
import SwiftUI

#if os(iOS) || os(watchOS) || os(tvOS)
@testable import Grid
#else
@testable import GridMac
#endif

class PositionRowsScrollTest: XCTestCase {

    private struct MockPositioner: LayoutPositioning {}
    private let positioner = MockPositioner()
    private let mockView = AnyView(EmptyView())
    
    func testScrollModeColumnsFlowStage1() throws {
        let gridElements = [
            GridElement(self.mockView, id: AnyHashable(0)),
            GridElement(self.mockView, id: AnyHashable(1)),
            GridElement(self.mockView, id: AnyHashable(2)),
            GridElement(self.mockView, id: AnyHashable(3)),
            GridElement(self.mockView, id: AnyHashable(4))
        ]
        
        let positionedItems: [PositionedItem] = [
            PositionedItem(bounds: CGRect(x: 0.0, y: -178.0, width: 250.0, height: 228.5), gridElement: gridElements[0]),
            PositionedItem(bounds: CGRect(x: 0.0, y: -178.0, width: 251.5, height: 40.5), gridElement: gridElements[1]),
            PositionedItem(bounds: CGRect(x: 0.0, y: -178.0, width: 210.0, height: 316.5), gridElement: gridElements[2]),
            PositionedItem(bounds: CGRect(x: 0.0, y: -178.0, width: 600.0, height: 84.5), gridElement: gridElements[3]),
            PositionedItem(bounds: CGRect(x: 0.0, y: -178.0, width: 300.0, height: 162.5), gridElement: gridElements[4])
        ]
        
        let arrangedItems: [ArrangedItem] = [
            ArrangedItem(gridElement: gridElements[0], startIndex: [0, 0], endIndex: [0, 0]),
            ArrangedItem(gridElement: gridElements[1], startIndex: [0, 1], endIndex: [0, 1]),
            ArrangedItem(gridElement: gridElements[2], startIndex: [1, 0], endIndex: [1, 1]),
            ArrangedItem(gridElement: gridElements[3], startIndex: [1, 2], endIndex: [2, 2]),
            ArrangedItem(gridElement: gridElements[4], startIndex: [2, 0], endIndex: [4, 0])
        ]
        let arrangement = LayoutArrangement(columnsCount: 5, rowsCount: 3, items: arrangedItems)
        
        let task = PositioningTask(items: positionedItems,
                                   arrangement: arrangement,
                                   boundingSize: CGSize(width: 375.0, height: 647.0),
                                   tracks: [.fr(1), .fit, .fit],
                                   contentMode: .scroll,
                                   flow: .columns)

        let resultPositions = self.positioner.reposition(task)
        
        let referencePositionedItems = [
            PositionedItem(bounds: CGRect(x: 0.0, y: 0.0, width: 253.0, height: 522.0), gridElement: gridElements[0]),
            PositionedItem(bounds: CGRect(x: 0.0, y: 522.0, width: 252.0, height: 41.0), gridElement: gridElements[1]),
            PositionedItem(bounds: CGRect(x: 349.0, y: 0.0, width: 405.0, height: 563.0), gridElement: gridElements[2]),
            PositionedItem(bounds: CGRect(x: 269.0, y: 562.0, width: 635.0, height: 85.0), gridElement: gridElements[3]),
            PositionedItem(bounds: CGRect(x: 656.0, y: 0.0, width: 301.0, height: 522.0), gridElement: gridElements[4])
        ]
        
        let referencePosition = PositionedLayout(items: referencePositionedItems, totalSize: CGSize(width: 957.0, height: 647.0))
        
        XCTAssertEqual(resultPositions, referencePosition)
    }
    
    func testScrollModeColumnsFlowStage2() throws {
        let gridElements = [
            GridElement(self.mockView, id: AnyHashable(0)),
            GridElement(self.mockView, id: AnyHashable(1)),
            GridElement(self.mockView, id: AnyHashable(2)),
            GridElement(self.mockView, id: AnyHashable(3)),
            GridElement(self.mockView, id: AnyHashable(4))
        ]
        
        let positionedItems: [PositionedItem] = [
            PositionedItem(bounds: CGRect(x: -177.5, y: -197.0, width: 250.0, height: 228.5), gridElement: gridElements[0]),
            PositionedItem(bounds: CGRect(x: -178.5, y: 178.5, width: 251.5, height: 40.5), gridElement: gridElements[1]),
            PositionedItem(bounds: CGRect(x: 170.5, y: -220.5, width: 210.0, height: 316.5), gridElement: gridElements[2]),
            PositionedItem(bounds: CGRect(x: 90.5, y: 219.5, width: 610.0, height: 84.5), gridElement: gridElements[3]),
            PositionedItem(bounds: CGRect(x: 478.5, y: -164.0, width: 300.0, height: 162.5), gridElement: gridElements[4])
        ]
        
        let arrangedItems: [ArrangedItem] = [
            ArrangedItem(gridElement: gridElements[0], startIndex: [0, 0], endIndex: [0, 0]),
            ArrangedItem(gridElement: gridElements[1], startIndex: [0, 1], endIndex: [0, 1]),
            ArrangedItem(gridElement: gridElements[2], startIndex: [1, 0], endIndex: [1, 1]),
            ArrangedItem(gridElement: gridElements[3], startIndex: [1, 2], endIndex: [2, 2]),
            ArrangedItem(gridElement: gridElements[4], startIndex: [2, 0], endIndex: [4, 0])
        ]
        let arrangement = LayoutArrangement(columnsCount: 5, rowsCount: 3, items: arrangedItems)
        
        let task = PositioningTask(items: positionedItems,
                                   arrangement: arrangement,
                                   boundingSize: CGSize(width: 375.0, height: 647.0),
                                   tracks: [.fr(1), .fit, .fit],
                                   contentMode: .scroll,
                                   flow: .columns)
        
        let resultPositions = self.positioner.reposition(task)
        
        let referencePositionedItems = [
            PositionedItem(bounds: CGRect(x: 0.0, y: 0.0, width: 253.0, height: 522.0), gridElement: gridElements[0]),
            PositionedItem(bounds: CGRect(x: 0.0, y: 522.0, width: 252.0, height: 41.0), gridElement: gridElements[1]),
            PositionedItem(bounds: CGRect(x: 351.0, y: 0.0, width: 411.0, height: 563.0), gridElement: gridElements[2]),
            PositionedItem(bounds: CGRect(x: 268.0, y: 562.0, width: 643.0, height: 85.0), gridElement: gridElements[3]),
            PositionedItem(bounds: CGRect(x: 661.0, y: 0.0, width: 299.0, height: 522.0), gridElement: gridElements[4])
        ]
        
        let referencePosition = PositionedLayout(items: referencePositionedItems, totalSize: CGSize(width: 961.0, height: 647.0))
        
        XCTAssertEqual(resultPositions, referencePosition)
    }
}
