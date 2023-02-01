//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/31/23.
//

import SwiftUI

struct TenorClef: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Asset(named: ClefNameVariant.TenorClef.rawValue)
            .scaledToFit()
            .frame(height: measureSpacing.clefHeight + measureSpacing.spacing * 1.5)
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line2YTop)
    }
}

struct TenorClef_Previews: PreviewProvider {
    static var previews: some View {
        TenorClef(measureSpacing: MeasureSpacing(width: 300))
    }
}
