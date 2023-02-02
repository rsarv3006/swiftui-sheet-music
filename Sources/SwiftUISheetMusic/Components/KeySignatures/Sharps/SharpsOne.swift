//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

import SwiftUI

struct SharpsOne: View {
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
            SharpSignNotation(height: height)
                .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line2(measureSpacing: measureSpacing))
        } else if clef == .TrebleClef {
            SharpSignNotation(height: height)
                .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line1(measureSpacing: measureSpacing))
        } else if clef == .AltoClef {
            SharpSignNotation(height: height)
                .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.space1(measureSpacing: measureSpacing))
        } else if clef == .TenorClef {
            SharpSignNotation(height: height)
                .position(x: xPosition, y: CalculateKeySignatureYValues.Sharps.line4(measureSpacing: measureSpacing))
        }

    }
    
}

struct SharpsOne_Previews: PreviewProvider {
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

