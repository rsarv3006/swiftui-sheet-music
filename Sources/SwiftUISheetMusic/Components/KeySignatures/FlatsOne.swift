//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct FlatsOne: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 5
        height = measureSpacing.spacing * 2
    }
    
    var body: some View {
        if clef == .BassClef {
            FlatSignNotation(height: height)
                .position(x: xPosition, y: measureSpacing.line3YTop * 1.06)
        } else if clef == .TrebleClef {
            FlatSignNotation(height: height)
                .position(x: xPosition, y: measureSpacing.line2YTop * 1.06)
        } else if clef == .AltoClef {
            FlatSignNotation(height: height)
                .position(x: xPosition, y: measureSpacing.line2YTop * 1.12)
        } else if clef == .TenorClef {
            FlatSignNotation(height: height)
                .position(x: xPosition, y: measureSpacing.line1YTop * 1.12)
        }

    }
    
}

struct FlatsOne_Previews: PreviewProvider {
    static var previews: some View {
        Measure(clefToShow: .TenorClef, measureBarVariant: .SingleBar)
    }
}
