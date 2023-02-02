//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import Foundation

// Counting from bottom to top
struct CalculateKeySignatureXValues {
    struct Flats {
        static func line1(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * 1.06
        }
        
        static func line2(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * 1.06
        }
        
        static func line3(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line2YTop * 1.06
        }
        
        static func line4(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line2YTop * 0.965
        }
        
        static func line5(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * 0.965
        }
        
        static func space1(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line4YTop * 1.01
        }
        
        static func space2(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * 1.01
        }
        
        static func space3(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * 1.12
        }
        
        static func space4(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * 1.01
        }
    }
}
