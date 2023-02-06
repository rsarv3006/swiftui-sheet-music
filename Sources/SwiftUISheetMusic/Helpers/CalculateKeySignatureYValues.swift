//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import Foundation

struct CalculateKeySignatureYValues {
    struct Flats {
        private static let flatsLineOffset: CGFloat = 0.965
        private static let flatsSpaceOffset: CGFloat = 1.01
        
        static func line5(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line5YTop * (flatsLineOffset + 0.01)
        }
        
        static func line4(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line4YTop * (flatsLineOffset + 0.01)
        }
        
        static func line3(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * flatsLineOffset
        }
        
        static func line2(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line2YTop * flatsLineOffset
        }
        
        static func line1(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * flatsLineOffset
        }

        static func space5(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line4YTop * 1.095
        }
        
        static func space4(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line4YTop * flatsSpaceOffset
        }
        
        static func space3(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * flatsSpaceOffset
        }
        
        static func space2(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line2YTop * flatsSpaceOffset
        }
        
        static func space1(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * flatsSpaceOffset
        }
    
    }
    
    struct Sharps {
        private static let sharpLineOffset: CGFloat = 1.005
        private static let sharpSpaceOffset: CGFloat = 1.055
        
        static func line5(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line5YTop * sharpLineOffset
        }
        
        static func line4(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line4YTop * sharpLineOffset
        }
        
        static func line3(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * sharpLineOffset
        }
        
        static func line2(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line2YTop * sharpLineOffset
        }
        
        static func line1(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * sharpLineOffset
        }
        
        static func space4(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line4YTop * sharpSpaceOffset
        }
        
        static func space3(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line3YTop * sharpSpaceOffset
        }
        
        static func space2(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line2YTop * sharpSpaceOffset
        }
        
        static func space1(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * sharpSpaceOffset
        }
        
        static func space0(measureSpacing: MeasureSpacing) -> CGFloat {
            return measureSpacing.line1YTop * 0.95
        }
    
    }
}
