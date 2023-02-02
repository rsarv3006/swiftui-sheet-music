//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI

import SwiftUI

struct SharpsTwo: View {
    private let measureSpacing: MeasureSpacing
    private let clef: ClefNameVariant
    private let xPosition: CGFloat
    private let height: CGFloat
    
    init(measureSpacing: MeasureSpacing, clef: ClefNameVariant) {
        self.measureSpacing = measureSpacing
        self.clef = clef
        
        xPosition = measureSpacing.spacing * 6
        height = measureSpacing.spacing * 2.3
    }
    
    var body: some View {
        ZStack {
            SharpsOne(measureSpacing: measureSpacing, clef: clef)
            if clef == .BassClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space3(measureSpacing: measureSpacing))
            } else if clef == .TrebleClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space2(measureSpacing: measureSpacing))
            } else if clef == .AltoClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line3(measureSpacing: measureSpacing))
            } else if clef == .TenorClef {
                SharpSignNotation(height: height)
                    .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line2(measureSpacing: measureSpacing))
            }
        }

    }
    
}

struct SharpsTwo_Previews: PreviewProvider {
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


