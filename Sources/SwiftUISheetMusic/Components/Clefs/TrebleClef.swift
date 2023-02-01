//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/31/23.
//

import SwiftUI

struct TrebleClef: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Asset(named: ClefNameVariant.TrebleClef.rawValue)
            .scaledToFit()
            .frame(height: measureSpacing.clefHeight + measureSpacing.spacing * 4)
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line1YTop + measureSpacing.spacing / 1.25 + measureSpacing.clefHeight / 2)
    }
}

struct TrebleClef_Previews: PreviewProvider {
    static var previews: some View {
        TrebleClef(measureSpacing: MeasureSpacing(width: 300))
    }
}
