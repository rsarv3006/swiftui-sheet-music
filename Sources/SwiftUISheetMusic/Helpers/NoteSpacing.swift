//
//  NoteSpacing.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/16/23.
//

import Foundation

struct NoteSpacing {
    let space1YPosition: CGFloat
    
    init(measureSpacing: MeasureSpacing) {
        space1YPosition = measureSpacing.line1YBottom * 1.05
    }
}
