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
    
    func testPercussionClef() throws {
        let sut = PercussionClefView(measureSpacing: MeasureSpacing(width: 300))
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{E069}")
    }
    
    func testClefViewForMeasureBaSSClefIsVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .BassClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let value = try sut.inspect().view(ClefViewForMeasure.self).view(BassClefView.self).text().string()
        XCTAssertEqual(value, "\u{E062}")
    }
    
    func testClefViewForMeasureTrebleClefIsVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .TrebleClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let value = try sut.inspect().view(ClefViewForMeasure.self).view(TrebleClefView.self).text().string()
        XCTAssertEqual(value, "\u{E050}")
    }
    
    func testClefViewForMeasureTenorClefIsVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .TenorClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let value = try sut.inspect().view(ClefViewForMeasure.self).view(TenorClefView.self).text().string()
        XCTAssertEqual(value, "\u{E05C}")
    }
    
    func testClefViewForMeasureAltoClefIsVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .AltoClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let value = try sut.inspect().view(ClefViewForMeasure.self).view(AltoClefView.self).text().string()
        XCTAssertEqual(value, "\u{E05C}")
    }
    
    func testClefViewForMeasurePercussionClefIsVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .PercussionClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let value = try sut.inspect().view(ClefViewForMeasure.self).view(PercussionClefView.self).text().string()
        XCTAssertEqual(value, "\u{E069}")
    }
    
    func testClefViewForMeasureClefIsNotVisible() throws {
        let sut = ClefViewForMeasure(clefToShow: .BassClef, measureSpacing: MeasureSpacing(width: 300), isClefVisible: false)
        let _ = try sut.inspect().view(ClefViewForMeasure.self).find(ViewType.EmptyView.self)
    }
    
    func testClefViewForMeasureSelectedClefIsNone() throws {
        let sut = ClefViewForMeasure(clefToShow: .none, measureSpacing: MeasureSpacing(width: 300), isClefVisible: true)
        let _ = try sut.inspect().view(ClefViewForMeasure.self).find(ViewType.EmptyView.self)
    }

}
