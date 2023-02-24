//
//  ClefViewTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/22/23.
//

import XCTest
import ViewInspector
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
    
    func testClefViewForMeasureClefIsVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .BassClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let value = try sut.inspect().view(ClefViewForMeasure.self).view(BassClefView.self).text().string()
        XCTAssertEqual(value, "\u{E062}")
    }
    
    func testClefViewForMeasureClefIsNotVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .BassClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: false)
        let _ = try sut.inspect().view(ClefViewForMeasure.self).find(ViewType.EmptyView.self)
        
    }

}
