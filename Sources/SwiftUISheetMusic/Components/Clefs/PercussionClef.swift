//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct PercussionClef: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Text("\u{E069}").font(Font.custom("Bravura", size: measureSpacing.clefHeight + measureSpacing.spacing)).foregroundColor(.ui.black)
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line3YBottom)

    }
}

struct PercussionClef_Previews: PreviewProvider {
    static var previews: some View {
        PercussionClef(measureSpacing: MeasureSpacing(width: 300))
    }
}
