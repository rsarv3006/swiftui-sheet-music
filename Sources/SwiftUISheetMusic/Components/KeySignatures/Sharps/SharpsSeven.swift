//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI

struct SharpsSeven: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 11
        height = measureSpacing.spacing * 2.3
    }
    
    var body: some View {
        ZStack {
            SharpsSix(measureSpacing: measureSpacing, clef: clef)
            if clef == .BassClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line4(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line3(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space3(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space2(measureSpacing: measureSpacing))
            }
        }

    }
    
}

struct SharpsSeven_Previews: PreviewProvider {
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
