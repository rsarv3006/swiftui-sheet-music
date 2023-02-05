//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI

struct FlatsSeven: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    private let leftOffset: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant, leftOffset: CGFloat = 0) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 11 + leftOffset
        height = measureSpacing.spacing * 2
        self.leftOffset = leftOffset
    }
    
    var body: some View {
        ZStack {
            FlatsSix(measureSpacing: measureSpacing, clef: clef, leftOffset: leftOffset)
            if clef == .BassClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.space5(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.space4(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.line5(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Flats.line4(measureSpacing: measureSpacing))
            }
        }
    }
}

struct FlatsSeven_Previews: PreviewProvider {
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
