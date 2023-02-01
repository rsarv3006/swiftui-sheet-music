//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/31/23.
//

import SwiftUI

struct ClefViewForMeasure: View {
    private let clefToShow: ClefNameVariant
    private let measureSpacing: MeasureSpacing
    
    init(clefToShow: ClefNameVariant, measureSpacing: MeasureSpacing) {
        self.clefToShow = clefToShow
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        if clefToShow == .BassClef {
            BassClef(measureSpacing: measureSpacing)
        } else if clefToShow == .TrebleClef {
            TrebleClef(measureSpacing: measureSpacing)
        } else if clefToShow == .TenorClef {
            TenorClef(measureSpacing: measureSpacing)
        } else if clefToShow == .AltoClef {
            AltoClef(measureSpacing: measureSpacing)
        } else if clefToShow == .PercussionClef {
            PercussionClef(measureSpacing: measureSpacing)
        }
    }
}

struct ClefViewForMeasure_Previews: PreviewProvider {
    static var previews: some View {
        ClefViewForMeasure(clefToShow: .BassClef, measureSpacing: MeasureSpacing(width: 300))
    }
}
