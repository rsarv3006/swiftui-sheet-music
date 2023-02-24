//
//  ClefViewTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/22/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class ClefViewTests: XCTestCase {

    func testAltoClef() throws {
        let sut = AltoClefView(measureSpacing: MeasureSpacing(width: 300))
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{E05C}")
    }
    
    func testTenorClef() throws {
        let sut = TenorClefView(measureSpacing: MeasureSpacing(width: 300))
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{E05C}")
    }
    
    func testBassClef() throws {
        let sut = BassClefView(measureSpacing: MeasureSpacing(width: 300))
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{E062}")
    }
    
    func testTrebleClef() throws {
        let sut = TrebleClefView(measureSpacing: MeasureSpacing(width: 300))
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{E050}")
    }
    
    

}
