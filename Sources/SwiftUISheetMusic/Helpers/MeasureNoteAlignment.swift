//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/13/23.
//

import Foundation

class MeasureNoteAlignment {
    private let measureSpacing: MeasureSpacing
    
    init (measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var wholeNoteHeight: CGFloat {
        get {
            return measureSpacing.spacing * 2
        }
    }
}
