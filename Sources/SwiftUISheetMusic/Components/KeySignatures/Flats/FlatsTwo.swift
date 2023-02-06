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
    private let leftOffset: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant, leftOffset: CGFloat = 0) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 6
        height = measureSpacing.spacing * 2
        self.leftOffset = leftOffset
    }
    
    var body: some View {
        ZStack {
            FlatsOne(measureSpacing: measureSpacing, clef: clef, leftOffset: leftOffset)
            if clef == .BassClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.space2(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.space1(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.line2(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.line1(measureSpacing: measureSpacing))
            }
        }
    }
}

struct FlatsTwo_Previews: PreviewProvider {
    static var previews: some View {
        FlatsTwo(measureSpacing: MeasureSpacing(width: 300), clef: .BassClef)
    }
}
