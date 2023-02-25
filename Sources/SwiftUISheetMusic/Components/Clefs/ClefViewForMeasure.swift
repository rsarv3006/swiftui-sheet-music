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
        if !isClefVisible || clefToShow == .none {
            EmptyView()
        } else if clefToShow == .BassClef {
            BassClefView(measureSpacing: measureSpacing)
        } else if clefToShow == .TrebleClef {
            TrebleClefView(measureSpacing: measureSpacing)
        } else if clefToShow == .TenorClef {
            TenorClefView(measureSpacing: measureSpacing)
        } else if clefToShow == .AltoClef {
            AltoClefView(measureSpacing: measureSpacing)
        } else if clefToShow == .PercussionClef {
            PercussionClefView(measureSpacing: measureSpacing)
        }
    }
}
