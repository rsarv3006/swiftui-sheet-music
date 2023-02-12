//
//  TimeSignatureUtilsTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/10/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class TimeSignatureUtilsTests: XCTestCase {

    func testNonZeroInteger() throws {
        let codes = TimeSignatureUtils.convertTimeSignatureToCodes(number: 4)
        XCTAssertEqual(codes, ["\u{E084}"])
    }
    
    func testNegativeInteger() throws {
        let codes = TimeSignatureUtils.convertTimeSignatureToCodes(number: -1)
        XCTAssertEqual(codes, ["\u{E081}"])
    }

}
