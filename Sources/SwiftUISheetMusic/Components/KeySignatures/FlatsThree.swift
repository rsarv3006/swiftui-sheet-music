//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//FlatsThree

import SwiftUI

struct FlatsThree: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 7
        height = measureSpacing.spacing * 2
    }
    
    var body: some View {
        ZStack {
            FlatsTwo(measureSpacing: measureSpacing, clef: clef)
            if clef == .BassClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureXValues.Flats.space4(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureXValues.Flats.space3(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureXValues.Flats.line4(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                FlatSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureXValues.Flats.line3(measureSpacing: measureSpacing))
            }
        }
    }
}

struct FlatsThree_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                Measure(clefToShow: .TrebleClef)
                Measure(clefToShow: .BassClef)
            }.padding()
            
            HStack (spacing: 0) {
                Measure(clefToShow: .TenorClef)
                Measure(clefToShow: .AltoClef)
            }.padding()
        }
    }
}
