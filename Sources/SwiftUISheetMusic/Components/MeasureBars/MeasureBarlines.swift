//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI

struct MeasureBarlines: View {
    private let measureBarlineUtil: MeasureBarlineUtil
    private let measureBarVariant: MeasureBarlineVariant
    
    init(measureSpacing: MeasureSpacing) {
        self.measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing)
        self.measureBarVariant = measureSpacing.measureBarVariant
    }
    
    var body: some View {
        ZStack {
            Path { path in
                path.addLines(measureBarlineUtil.pointsArray)
            }
            
            if measureBarVariant == .EndRepeatBar {
                Circle()
                    .path(in: CGRect(x: measureBarlineUtil.endRepeatBarOffset, y: measureBarlineUtil.dotOneYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                    .foregroundColor(Color.black)
                Circle()
                    .path(in: CGRect(x: measureBarlineUtil.endRepeatBarOffset, y: measureBarlineUtil.dotTwoYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct MeasureBarlines_Previews: PreviewProvider {
    @State static var clefToShow: ClefNameVariant = .BassClef
    @State static var measureBarVariant: MeasureBarlineVariant = .EndRepeatBar
    @State static var keySignatureToShow: KeySignature = KeySignatures.EFlatMajor
    
    static var previews: some View {
        Measure(clefToShow: $clefToShow, measureBarVariant: $measureBarVariant, keySignatureToShow: $keySignatureToShow, isClefVisible: .constant(true))
            .padding()
    }
}
