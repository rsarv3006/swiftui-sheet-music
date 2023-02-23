//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/31/23.
//

import SwiftUI

struct AltoClefView: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Text("\u{E05C}").font(Font.custom("Bravura", size: measureSpacing.clefHeight + measureSpacing.spacing))
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line3YBottom)
    }
}

struct AltoClefView_Previews: PreviewProvider {
    static var previews: some View {
        AltoClefView(measureSpacing: MeasureSpacing(width: 300))
    }
}