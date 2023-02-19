//
//  KeySignatureModelTests.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/19/23.
//

import XCTest
@testable import SwiftUISheetMusic

final class KeySignatureModelTests: XCTestCase {

    func testHashableAreEqual() throws {
        let firstKeySignature = KeySignatures.BFlatMajor
        let secondKeySignature = KeySignatures.BFlatMajor
        
        XCTAssertTrue(firstKeySignature == secondKeySignature)
    }
    
    func testHashableAreNotEqual() throws {
        let firstKeySignature = KeySignatures.BFlatMajor
        let secondKeySignature = KeySignatures.CFlatMajor
        
        XCTAssertFalse(firstKeySignature == secondKeySignature)
    }
}
