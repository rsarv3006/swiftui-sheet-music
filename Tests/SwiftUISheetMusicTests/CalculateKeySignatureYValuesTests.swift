//
//  CalculateKeySignatureYValues.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class CalculateKeySignatureYValuesTests: XCTestCase {
    func testFlatsLines() {
        let measureSpacing = MeasureSpacing(width: 300)
        
        let line1 = CalculateKeySignatureYValues.Flats.line1(measureSpacing: measureSpacing)
        XCTAssertEqual(line1, 78.16499999999999)
        
        let line2 = CalculateKeySignatureYValues.Flats.line2(measureSpacing: measureSpacing)
        XCTAssertEqual(line2, 86.85)
        
        let line3 = CalculateKeySignatureYValues.Flats.line3(measureSpacing: measureSpacing)
        XCTAssertEqual(line3, 95.535)
        
        let line4 = CalculateKeySignatureYValues.Flats.line4(measureSpacing: measureSpacing)
        XCTAssertEqual(line4, 104.22)
        
        let line5 = CalculateKeySignatureYValues.Flats.line5(measureSpacing: measureSpacing)
        XCTAssertEqual(line5, 112.905)
    }
    
    func testFlatsLinesWithModifiedSpacing() {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        
        let line1 = CalculateKeySignatureYValues.Flats.line1(measureSpacing: measureSpacing)
        XCTAssertEqual(line1, 117.2475)
        
        let line2 = CalculateKeySignatureYValues.Flats.line2(measureSpacing: measureSpacing)
        XCTAssertEqual(line2, 130.275)
        
        let line3 = CalculateKeySignatureYValues.Flats.line3(measureSpacing: measureSpacing)
        XCTAssertEqual(line3, 143.3025)
        
        let line4 = CalculateKeySignatureYValues.Flats.line4(measureSpacing: measureSpacing)
        XCTAssertEqual(line4, 156.32999999999998)
        
        let line5 = CalculateKeySignatureYValues.Flats.line5(measureSpacing: measureSpacing)
        XCTAssertEqual(line5, 169.3575)
    }

    func testFlatsSpaces() {
        let measureSpacing = MeasureSpacing(width: 300)
        
        let space1 = CalculateKeySignatureYValues.Flats.space1(measureSpacing: measureSpacing)
        XCTAssertEqual(space1, 81.81)
        
        let space2 = CalculateKeySignatureYValues.Flats.space2(measureSpacing: measureSpacing)
        XCTAssertEqual(space2, 90.9)
        
        let space3 = CalculateKeySignatureYValues.Flats.space3(measureSpacing: measureSpacing)
        XCTAssertEqual(space3, 99.99)
        
        let space4 = CalculateKeySignatureYValues.Flats.space4(measureSpacing: measureSpacing)
        XCTAssertEqual(space4, 109.08)
        
        let space5 = CalculateKeySignatureYValues.Flats.space5(measureSpacing: measureSpacing)
        XCTAssertEqual(space5, 116.64000000000001)
    }
    
    func testFlatsSpacesWithModifiedSpacing() {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        
        let space1 = CalculateKeySignatureYValues.Flats.space1(measureSpacing: measureSpacing)
        XCTAssertEqual(space1, 122.715)
        
        let space2 = CalculateKeySignatureYValues.Flats.space2(measureSpacing: measureSpacing)
        XCTAssertEqual(space2, 136.35)
        
        let space3 = CalculateKeySignatureYValues.Flats.space3(measureSpacing: measureSpacing)
        XCTAssertEqual(space3, 149.985)
        
        let space4 = CalculateKeySignatureYValues.Flats.space4(measureSpacing: measureSpacing)
        XCTAssertEqual(space4, 163.62)
        
        let space5 = CalculateKeySignatureYValues.Flats.space5(measureSpacing: measureSpacing)
        XCTAssertEqual(space5, 174.96)
    }
    
    // sharps
    func testSharpsLines() {
        let measureSpacing = MeasureSpacing(width: 300)
        
        let line1 = CalculateKeySignatureYValues.Sharps.line1(measureSpacing: measureSpacing)
        XCTAssertEqual(line1, 81.40499999999999)
        
        let line2 = CalculateKeySignatureYValues.Sharps.line2(measureSpacing: measureSpacing)
        XCTAssertEqual(line2, 90.44999999999999)
        
        let line3 = CalculateKeySignatureYValues.Sharps.line3(measureSpacing: measureSpacing)
        XCTAssertEqual(line3, 99.49499999999999)
        
        let line4 = CalculateKeySignatureYValues.Sharps.line4(measureSpacing: measureSpacing)
        XCTAssertEqual(line4, 108.53999999999999)
        
        let line5 = CalculateKeySignatureYValues.Sharps.line5(measureSpacing: measureSpacing)
        XCTAssertEqual(line5, 117.585)
    }
    
    func testSharpsLinesWithModifiedSpacing() {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        
        let line1 = CalculateKeySignatureYValues.Sharps.line1(measureSpacing: measureSpacing)
        XCTAssertEqual(line1, 122.10749999999999)
        
        let line2 = CalculateKeySignatureYValues.Sharps.line2(measureSpacing: measureSpacing)
        XCTAssertEqual(line2, 135.67499999999998)
        
        let line3 = CalculateKeySignatureYValues.Sharps.line3(measureSpacing: measureSpacing)
        XCTAssertEqual(line3, 149.24249999999998)
        
        let line4 = CalculateKeySignatureYValues.Sharps.line4(measureSpacing: measureSpacing)
        XCTAssertEqual(line4, 162.80999999999997)
        
        let line5 = CalculateKeySignatureYValues.Sharps.line5(measureSpacing: measureSpacing)
        XCTAssertEqual(line5, 176.37749999999997)
    }

    func testSharpsSpaces() {
        let measureSpacing = MeasureSpacing(width: 300)
        
        let space0 = CalculateKeySignatureYValues.Sharps.space0(measureSpacing: measureSpacing)
        XCTAssertEqual(space0, 76.95)
        
        let space1 = CalculateKeySignatureYValues.Sharps.space1(measureSpacing: measureSpacing)
        XCTAssertEqual(space1, 85.455)
        
        let space2 = CalculateKeySignatureYValues.Sharps.space2(measureSpacing: measureSpacing)
        XCTAssertEqual(space2, 94.94999999999999)
        
        let space3 = CalculateKeySignatureYValues.Sharps.space3(measureSpacing: measureSpacing)
        XCTAssertEqual(space3, 104.445)
        
        let space4 = CalculateKeySignatureYValues.Sharps.space4(measureSpacing: measureSpacing)
        XCTAssertEqual(space4, 113.94)
        
    }
    
    func testSharpsSpacesWithModifiedSpacing() {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        
        let space0 = CalculateKeySignatureYValues.Sharps.space0(measureSpacing: measureSpacing)
        XCTAssertEqual(space0, 115.425)
        
        let space1 = CalculateKeySignatureYValues.Sharps.space1(measureSpacing: measureSpacing)
        XCTAssertEqual(space1, 128.1825)
        
        let space2 = CalculateKeySignatureYValues.Sharps.space2(measureSpacing: measureSpacing)
        XCTAssertEqual(space2, 142.42499999999998)
        
        let space3 = CalculateKeySignatureYValues.Sharps.space3(measureSpacing: measureSpacing)
        XCTAssertEqual(space3, 156.6675)
        
        let space4 = CalculateKeySignatureYValues.Sharps.space4(measureSpacing: measureSpacing)
        XCTAssertEqual(space4, 170.91)
        
    }
}
