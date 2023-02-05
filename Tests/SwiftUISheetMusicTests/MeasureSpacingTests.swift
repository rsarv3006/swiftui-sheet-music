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
    
    func testClefHeight() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.clefHeight, 27.0)
    }
    
    func testClefHeightWithLedgerLines() throws {
        let sut = MeasureSpacing(width: 300)
        XCTAssertEqual(sut.clefHeight, 27.0)
    }
    
}
