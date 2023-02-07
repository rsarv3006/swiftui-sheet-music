//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI

struct SharpsSix: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    private let leftOffset: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant, leftOffset: CGFloat = 0) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = (measureSpacing.spacing * 10) - leftOffset
        height = measureSpacing.spacing * 2.3
        self.leftOffset = leftOffset
    }
    
    var body: some View {
        ZStack {
            SharpsFive(measureSpacing: measureSpacing, clef: clef, leftOffset: leftOffset)
            if clef == .BassClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space2(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space1(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line2(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line1(measureSpacing: measureSpacing))
            }
        }
    }
}

struct SharpsSix_Previews: PreviewProvider {
    static var previews: some View {
        SharpsSix(measureSpacing: MeasureSpacing(width: 300), clef: .BassClef)
    }
    
}
