//
//  TimeSignatureViewTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/24/23.
//

import XCTest
import SwiftUI
import ViewInspector
import MusicNotation

@testable import SwiftUISheetMusic

final class TimeSignatureViewTests: XCTestCase {

    func testTimeSignature() throws {
        let sut = TimeSignatureView(measureSpacing: MeasureSpacing(width: 300), isClefVisible: .constant(true), numberOfKeySignatureSymbols: .constant(1), timeSignature: TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120), isTimeSignatureVisible: .constant(true))
        let topValue = try sut.inspect().view(TimeSignatureView.self).vStack().hStack(0).find(text: "\u{E084}").string()
        let bottomValue = try sut.inspect().view(TimeSignatureView.self).vStack().hStack(1).find(text: "\u{E084}").string()
        
        XCTAssertEqual(topValue, "\u{E084}")
        XCTAssertEqual(bottomValue, "\u{E084}")
    }
    
    func testTimeSignatureIsNotVisible() throws {
        let sut = TimeSignatureView(measureSpacing: MeasureSpacing(width: 300), isClefVisible: .constant(true), numberOfKeySignatureSymbols: .constant(1), timeSignature: TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120), isTimeSignatureVisible: .constant(false))
        let _ = try sut.inspect().view(TimeSignatureView.self).find(ViewType.EmptyView.self)
        let _ = try sut.inspect().view(TimeSignatureView.self).find(ViewType.EmptyView.self)
        
    }

}
