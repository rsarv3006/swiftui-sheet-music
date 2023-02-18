//
//  KeySignatureTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/5/23.
//

import XCTest
import ViewInspector
import SwiftUI

@testable import SwiftUISheetMusic

final class KeySignatureTests: XCTestCase {
    
    func testFlatSignNotation() throws {
        let sut = FlatSignNotation(height: 32)
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{266D}")
    }
    
    func testSharpSignNotation() throws {
        let sut = SharpSignNotation(height: 32)
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{266F}")
    }
    
    func testNaturalSignNotation() throws {
        let sut = NaturalSignNotation(height: 32)
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "\u{266E}")
    }
    
    func testKeySignatureViewWithFlats() throws {
        let measureSpacing = MeasureSpacing(width: 300)
        let sut = KeySignatureView(measureSpacing: measureSpacing, clefNameVariant: .constant(.BassClef), selectedKeySignature: .constant(KeySignatures.CFlatMajor), isClefVisible: .constant(true))
        
        let value = try sut.inspect().find(KeySignatureView.self).view(FlatsSeven.self).zStack().view(FlatsSix.self, 0).zStack().view(FlatsFive.self, 0).zStack().view(FlatsFour.self, 0).zStack().view(FlatsThree.self, 0).zStack().view(FlatsTwo.self, 0).zStack().view(FlatsOne.self, 0).view(FlatSignNotation.self, 0).text().string()
        XCTAssertEqual(value, "\u{266D}")
    }
    
    func testKeySignatureViewWithSharps() throws {
        let measureSpacing = MeasureSpacing(width: 300)
        let sut = KeySignatureView(measureSpacing: measureSpacing, clefNameVariant: .constant(.BassClef), selectedKeySignature: .constant(KeySignatures.CSharpMajor), isClefVisible: .constant(true))
        
        let value = try sut.inspect().find(KeySignatureView.self).view(SharpsSeven.self).zStack().view(SharpsSix.self, 0).zStack().view(SharpsFive.self, 0).zStack().view(SharpsFour.self, 0).zStack().view(SharpsThree.self, 0).zStack().view(SharpsTwo.self, 0).zStack().view(SharpsOne.self, 0).view(SharpSignNotation.self, 0).text().string()
        XCTAssertEqual(value, "\u{266F}")
    }
    
    func testKeySignatureViewWithNone() throws {
        let measureSpacing = MeasureSpacing(width: 300)
        let sut = KeySignatureView(measureSpacing: measureSpacing, clefNameVariant: .constant(.BassClef), selectedKeySignature: .constant(KeySignatures.CMajor), isClefVisible: .constant(true))
        
        let _ = try sut.inspect().find(ViewType.EmptyView.self)
        
    }
}
