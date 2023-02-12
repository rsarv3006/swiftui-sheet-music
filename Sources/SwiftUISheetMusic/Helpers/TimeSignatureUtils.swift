//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/8/23.
//

import SwiftUI

public struct TimeSignatureUtils {
    
    static func convertTimeSignatureToCodes(number: Int) -> [String] {
        let digitsArray = String(number).compactMap { Int(String($0)) }
        
        var codes: [String] = []
        
        for digit in digitsArray {
            if let code = TimeSignatureNumbersCodeDict[digit] {
                codes.append(code)
            }
        }
        
        return codes
    }
}
