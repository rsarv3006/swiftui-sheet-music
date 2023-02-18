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
    private let isClefVisible: Bool
    
    init(clefToShow: ClefNameVariant, measureSpacing: MeasureSpacing, isClefVisible: Bool) {
        self.clefToShow = clefToShow
        self.measureSpacing = measureSpacing
        self.isClefVisible = isClefVisible
    }
    
    var body: some View {
        if !isClefVisible {
            EmptyView()
        } else if clefToShow == .BassClef {
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
