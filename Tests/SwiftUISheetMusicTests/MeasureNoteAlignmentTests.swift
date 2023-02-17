//
//  MeasureNoteAlignmentTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/16/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class MeasureNoteAlignmentTests: XCTestCase {
    func testMeasureNoteYAlignment() throws {
        let measureSpacing = MeasureSpacing(width: 300)
        let measureNoteAlignment = MeasureNoteAlignment(measureSpacing: measureSpacing)
        
        XCTAssertEqual(measureNoteAlignment.line1YPosition, 82.0)
        XCTAssertEqual(measureNoteAlignment.line2YPosition, 91.0)
        XCTAssertEqual(measureNoteAlignment.line3YPosition, 100.0)
        XCTAssertEqual(measureNoteAlignment.line4YPosition, 109.0)
        XCTAssertEqual(measureNoteAlignment.line5YPosition, 118.0)
        
        XCTAssertEqual(measureNoteAlignment.space1YPosition, 86.10000000000001)
        XCTAssertEqual(measureNoteAlignment.space2YPosition, 95.55)
        XCTAssertEqual(measureNoteAlignment.space3YPosition, 105.0)
        XCTAssertEqual(measureNoteAlignment.space4YPosition, 114.45)
        XCTAssertEqual(measureNoteAlignment.space5YPosition, 123.9)
    }
    
    func testMeasureNoteHeightDefaultSpacing() throws {
        let measureSpacing = MeasureSpacing(width: 300)
        let measureNoteAlignment = MeasureNoteAlignment(measureSpacing: measureSpacing)
        
        XCTAssertEqual(measureNoteAlignment.wholeNoteHeight, 16.0)
        

    }
    
    func testMeasureNoteHeightCustomSpacing() throws {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        let measureNoteAlignment = MeasureNoteAlignment(measureSpacing: measureSpacing)
        
        XCTAssertEqual(measureNoteAlignment.wholeNoteHeight, 24.0)
    }
}
