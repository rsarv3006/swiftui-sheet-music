//
//  NotesTest.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/24/23.
//

import XCTest
import SwiftUI
import ViewInspector
import MusicNotation

@testable import SwiftUISheetMusic

final class NotesTest: XCTestCase {

    func testQuarterNote() throws {
        let sut = QuarterNote(height: .constant(30), xPosition: .constant(0), yPosition: .constant(0))
        let value = try sut.inspect().view(QuarterNote.self).text().string()
        
        XCTAssertEqual(value, "\u{ECA6}")
    }
    
    func testWholeNote() throws {
        let sut = WholeNote(height: .constant(30), xPosition: .constant(0), yPosition: .constant(0))
        let value = try sut.inspect().view(WholeNote.self).text().string()
        
        XCTAssertEqual(value, "\u{ECA2}")
    }
}
