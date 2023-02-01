//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct FlatsTwo: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 6
        height = measureSpacing.spacing * 2
    }
    
    var body: some View {
        ZStack {
            FlatsOne(measureSpacing: measureSpacing, clef: clef)
            if clef == .BassClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: measureSpacing.line2YTop * 1.01)
            } else if clef == .TrebleClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: measureSpacing.line1YTop * 1.01)
            } else if clef == .AltoClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: measureSpacing.line2YTop * 0.965)
            } else if clef == .TenorClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: measureSpacing.line1YTop * 0.965)
            }
        }
    }
}

struct FlatsTwo_Previews: PreviewProvider {
    static var previews: some View {
        Measure(clefToShow: .TrebleClef, measureBarVariant: .SingleBar)
    }
}
