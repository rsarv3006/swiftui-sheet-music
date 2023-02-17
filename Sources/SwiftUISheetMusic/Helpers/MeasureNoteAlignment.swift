//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/13/23.
//

import Foundation

class MeasureNoteAlignment {
    private let measureSpacing: MeasureSpacing
    
    // Y Alignment
    let line1YPosition: CGFloat
    let line2YPosition: CGFloat
    let line3YPosition: CGFloat
    let line4YPosition: CGFloat
    let line5YPosition: CGFloat
    
    let space1YPosition: CGFloat
    let space2YPosition: CGFloat
    let space3YPosition: CGFloat
    let space4YPosition: CGFloat
    let space5YPosition: CGFloat
    
    // Note Height
    let wholeNoteHeight: CGFloat
    
    init (measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
        
        // Y Alignment
        line1YPosition = measureSpacing.line1YBottom
        line2YPosition = measureSpacing.line2YBottom
        line3YPosition = measureSpacing.line3YBottom
        line4YPosition = measureSpacing.line4YBottom
        line5YPosition = measureSpacing.line5YBottom
        
        space1YPosition = measureSpacing.line1YBottom * 1.05
        space2YPosition = measureSpacing.line2YBottom * 1.05
        space3YPosition = measureSpacing.line3YBottom * 1.05
        space4YPosition = measureSpacing.line4YBottom * 1.05
        space5YPosition = measureSpacing.line5YBottom * 1.05
        
        // Note Height
        wholeNoteHeight = measureSpacing.spacing * 2
    }
}
