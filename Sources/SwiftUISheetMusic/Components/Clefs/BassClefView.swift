//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/31/23.
// E062

import SwiftUI

struct BassClefView: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Text("\u{E062}").font(Font.custom("Bravura", size: measureSpacing.clefHeight + measureSpacing.spacing))
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line2YBottom)
    }
}

struct BassClefView_Previews: PreviewProvider {
    static var previews: some View {
        BassClefView(measureSpacing: MeasureSpacing(width: 300))
    }
}
