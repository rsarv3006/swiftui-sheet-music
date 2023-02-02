//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI

struct SharpsFive: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 9
        height = measureSpacing.spacing * 2.3
    }
    
    var body: some View {
        ZStack {
            SharpsFour(measureSpacing: measureSpacing, clef: clef)
            if clef == .BassClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space4(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space3(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line4(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line3(measureSpacing: measureSpacing))
            }
        }

    }
    
}

struct SharpsFive_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                Measure(clefToShow: .BassClef)
                Measure(clefToShow: .TrebleClef)
            }.padding()
            
            HStack (spacing: 0) {
                Measure(clefToShow: .AltoClef)
                Measure(clefToShow: .TenorClef)
            }.padding()
        }
    }
}

