//
//  MeasureBarlineUtil.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/3/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class MeasureBarlineUtilTest: XCTestCase {
    
    func testMeasureEndBarSingleLine() throws {
        let measureSpacing = MeasureSpacing(width: 300, measureBarVariant: .SingleBar)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        XCTAssertEqual(measureBarlineUtil.pointsArray, [CGPoint(x: 299.0, y: 81.0), CGPoint(x: 300.0, y: 81.0), CGPoint(x: 300.0, y: 118.0), CGPoint(x: 299.0, y: 118.0), CGPoint(x: 299.0, y: 81.0)])
    }
    
    func testMeasureEndBarEndLine() throws {
        let measureSpacing = MeasureSpacing(width: 300, measureBarVariant: .EndBar)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        XCTAssertEqual(measureBarlineUtil.pointsArray,
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
        let measureSpacing = MeasureSpacing(width: 300, measureBarVariant: .DoubleBar)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        XCTAssertEqual(measureBarlineUtil.pointsArray,
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
    
    func testDotSizeBasedOnSpacing() throws {
        let measureSpacing = MeasureSpacing(width: 300)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        XCTAssertEqual(measureBarlineUtil.dotSize, 2.6666666666666665)
    }
    
    func testMeasureEndRepeatBarline() throws {
        let measureSpacing = MeasureSpacing(width: 300, measureBarVariant: .EndRepeatBar)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        
        XCTAssertEqual(measureBarlineUtil.pointsArray,
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
    
    func testMeasureBeginAndEndRepeatBarPointsArray() throws {
        let measureSpacing = MeasureSpacing(width: 300, measureBarVariant: .BegingAndEndRepeatBars)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        
        XCTAssertEqual(measureBarlineUtil.pointsArray,
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
                        CGPoint(x: 292.0, y: 81.0),
                        CGPoint(x: 0.0, y: 81.0),
                        CGPoint(x: 4.0, y: 81.0),
                        CGPoint(x: 4.0, y: 118.0),
                        CGPoint(x: 0.0, y: 118.0),
                        CGPoint(x: 0.0, y: 81.0),
                        CGPoint(x: 7.0, y: 81.0),
                        CGPoint(x: 8.0, y: 81.0),
                        CGPoint(x: 8.0, y: 118.0),
                        CGPoint(x: 7.0, y: 118.0),
                        CGPoint(x: 7.0, y: 81.0)
                       ])
    }
    
    func testBeginRepeatBarPointsArray() throws {
        let measureSpacing = MeasureSpacing(width: 300, measureBarVariant: .BeginRepeatBar)
        let measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: 0)
        
        XCTAssertEqual(measureBarlineUtil.pointsArray, [
            CGPoint(x: 299.0, y: 81.0),
            CGPoint(x: 300.0, y: 81.0),
            CGPoint(x: 300.0, y: 118.0),
            CGPoint(x: 299.0, y: 118.0),
            CGPoint(x: 299.0, y: 81.0),
            CGPoint(x: 0.0, y: 81.0),
            CGPoint(x: 4.0, y: 81.0),
            CGPoint(x: 4.0, y: 118.0),
            CGPoint(x: 0.0, y: 118.0),
            CGPoint(x: 0.0, y: 81.0),
            CGPoint(x: 7.0, y: 81.0),
            CGPoint(x: 8.0, y: 81.0),
            CGPoint(x: 8.0, y: 118.0),
            CGPoint(x: 7.0, y: 118.0),
            CGPoint(x: 7.0, y: 81.0)
        ])
    }
}
