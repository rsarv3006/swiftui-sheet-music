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
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 10
        height = measureSpacing.spacing * 2.3
    }
    
    var body: some View {
        ZStack {
            SharpsFive(measureSpacing: measureSpacing, clef: clef)
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
    @State static var trebleClef: ClefNameVariant = .TrebleClef
    @State static var bassClef: ClefNameVariant = .BassClef
    @State static var tenorClef: ClefNameVariant = .TenorClef
    @State static var altoClef: ClefNameVariant = .AltoClef
    
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                Measure(clefToShow: $trebleClef)
                Measure(clefToShow: $bassClef)
            }.padding()
            
            HStack (spacing: 0) {
                Measure(clefToShow: $trebleClef)
                Measure(clefToShow: $altoClef)
            }.padding()
        }
    }
}
