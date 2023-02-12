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
        XCTAssertEqual(line1, 81.0)
        
        let line2 = CalculateKeySignatureYValues.Flats.line2(measureSpacing: measureSpacing)
        XCTAssertEqual(line2, 90.0)
        
        let line3 = CalculateKeySignatureYValues.Flats.line3(measureSpacing: measureSpacing)
        XCTAssertEqual(line3, 99.0)
        
        let line4 = CalculateKeySignatureYValues.Flats.line4(measureSpacing: measureSpacing)
        XCTAssertEqual(line4, 109.08)
        
        let line5 = CalculateKeySignatureYValues.Flats.line5(measureSpacing: measureSpacing)
        XCTAssertEqual(line5, 118.17)
    }
    
    func testFlatsLinesWithModifiedSpacing() {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        
        let line1 = CalculateKeySignatureYValues.Flats.line1(measureSpacing: measureSpacing)
        XCTAssertEqual(line1, 121.5)
        
        let line2 = CalculateKeySignatureYValues.Flats.line2(measureSpacing: measureSpacing)
        XCTAssertEqual(line2, 135)
        
        let line3 = CalculateKeySignatureYValues.Flats.line3(measureSpacing: measureSpacing)
        XCTAssertEqual(line3, 148.5)
        
        let line4 = CalculateKeySignatureYValues.Flats.line4(measureSpacing: measureSpacing)
        XCTAssertEqual(line4, 163.62)
        
        let line5 = CalculateKeySignatureYValues.Flats.line5(measureSpacing: measureSpacing)
        XCTAssertEqual(line5, 177.255)
    }

    func testFlatsSpaces() {
        let measureSpacing = MeasureSpacing(width: 300)
        
        let space1 = CalculateKeySignatureYValues.Flats.space1(measureSpacing: measureSpacing)
        XCTAssertEqual(space1, 85.05)
        
        let space2 = CalculateKeySignatureYValues.Flats.space2(measureSpacing: measureSpacing)
        XCTAssertEqual(space2, 94.5)
        
        let space3 = CalculateKeySignatureYValues.Flats.space3(measureSpacing: measureSpacing)
        XCTAssertEqual(space3, 103.95)
        
        let space4 = CalculateKeySignatureYValues.Flats.space4(measureSpacing: measureSpacing)
        XCTAssertEqual(space4, 113.4)
        
        let space5 = CalculateKeySignatureYValues.Flats.space5(measureSpacing: measureSpacing)
        XCTAssertEqual(space5, 122.03999999999999)
    }
    
    func testFlatsSpacesWithModifiedSpacing() {
        let measureSpacing = MeasureSpacing(width: 300, spacing: 12)
        
        let space1 = CalculateKeySignatureYValues.Flats.space1(measureSpacing: measureSpacing)
        XCTAssertEqual(space1, 127.575)
        
        let space2 = CalculateKeySignatureYValues.Flats.space2(measureSpacing: measureSpacing)
        XCTAssertEqual(space2, 141.75)
        
        let space3 = CalculateKeySignatureYValues.Flats.space3(measureSpacing: measureSpacing)
        XCTAssertEqual(space3, 155.925)
        
        let space4 = CalculateKeySignatureYValues.Flats.space4(measureSpacing: measureSpacing)
        XCTAssertEqual(space4, 170.1)
        
        let space5 = CalculateKeySignatureYValues.Flats.space5(measureSpacing: measureSpacing)
        XCTAssertEqual(space5, 183.05999999999997)
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
