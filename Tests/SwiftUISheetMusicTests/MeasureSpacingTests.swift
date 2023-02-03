//
//  MeasureSpacingTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/30/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class MeasureSpacingTests: XCTestCase {
    func testDefaultSpacing() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.spacing, 8)
    }
    
    func testDefaultLineHeight() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.lineHeight, 1)
    }
    
    func testVariableSpacing() throws {
        let sut = MeasureSpacing(width: 300, spacing: 16)
        XCTAssertEqual(sut.spacing, 16)
    }
    
    func testVariableLineHeight() throws {
        let sut = MeasureSpacing(width: 300, spacing: 16)
        XCTAssertEqual(sut.lineHeight, 2)
    }
    
    func testMeasureHeightWithLedgerLines() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.measureHeight, 199.0)
    }
    
    func testMeasureStartBarLineNotVisible() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.measureStartPointArray, [])
    }
    
    func testClefHeight() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.clefHeight, 27.0)
    }
    
    func testClefHeightWithLedgerLines() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.clefHeight, 27.0)
    }
    
    func testMeasureEndBarSingleLine() throws {
        let sut = MeasureSpacing(width: 300, measureBarVariant: .SingleBar)
        XCTAssertEqual(sut.measureEndPointArray, [CGPoint(x: 299.0, y: 81.0), CGPoint(x: 300.0, y: 81.0), CGPoint(x: 300.0, y: 118.0), CGPoint(x: 299.0, y: 118.0), CGPoint(x: 299.0, y: 81.0)])
    }
    
    func testMeasureEndBarEndLine() throws {
        let sut = MeasureSpacing(width: 300, measureBarVariant: .EndBar)
        XCTAssertEqual(sut.measureEndPointArray,
                       [
                        CGPoint(x: 296.0, y: 81.0),
                        CGPoint(x: 300.0, y: 81.0),
                        CGPoint(x: 300.0, y: 118.0),
                        CGPoint(x: 296.0, y: 118.0),
                        CGPoint(x: 296.0, y: 81.0),
                        CGPoint(x: 292.0, y: 81.0),
                        CGPoint(x: 293.0, y: 81.0),
                        CGPoint(x: 293.0, y: 118.0),
                        CGPoint(x: 292.0, y: 118.0),
                        CGPoint(x: 292.0, y: 81.0)
                       ]
        )
    }
    
    func testMeasureDoubleBarline() throws {
        let sut = MeasureSpacing(width: 300, measureBarVariant: .DoubleBar)
        XCTAssertEqual(sut.measureEndPointArray,
                       [
                        CGPoint(x: 299.0, y: 81.0),
                        CGPoint(x: 300.0, y: 81.0),
                        CGPoint(x: 300.0, y: 118.0),
                        CGPoint(x: 299.0, y: 118.0),
                        CGPoint(x: 299.0, y: 81.0),
                        CGPoint(x: 295.0, y: 81.0),
                        CGPoint(x: 296.0, y: 81.0),
                        CGPoint(x: 296.0, y: 118.0),
                        CGPoint(x: 295.0, y: 118.0),
                        CGPoint(x: 295.0, y: 81.0)
                       ]
        )
    }
}
