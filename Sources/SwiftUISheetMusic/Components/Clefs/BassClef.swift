//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/31/23.
//

import SwiftUI

struct BassClef: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Asset(named: ClefNameVariant.BassClef.rawValue)
            .scaledToFit()
            .frame(height: measureSpacing.clefHeight)
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line1YTop + measureSpacing.clefHeight / 2)
    }
}

struct BassClef_Previews: PreviewProvider {
    static var previews: some View {
        BassClef(measureSpacing: MeasureSpacing(width: 300))
    }
}
