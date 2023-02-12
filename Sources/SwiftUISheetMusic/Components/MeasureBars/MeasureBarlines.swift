//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import SwiftUI
import MusicNotation

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
            .foregroundColor(Color.ui.black)
            
            if measureBarVariant == .EndRepeatBar {
                Circle()
                    .path(in: CGRect(x: measureBarlineUtil.endRepeatBarOffset, y: measureBarlineUtil.dotOneYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                    .foregroundColor(Color.ui.black)
                Circle()
                    .path(in: CGRect(x: measureBarlineUtil.endRepeatBarOffset, y: measureBarlineUtil.dotTwoYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                    .foregroundColor(Color.ui.black)
            }
        }
    }
}

struct MeasureBarlines_Previews: PreviewProvider {
    @State static var clefToShow: ClefNameVariant = .BassClef
    @State static var measureBarVariant: MeasureBarlineVariant = .EndRepeatBar
    @State static var keySignatureToShow: KeySignature = KeySignatures.EFlatMajor
    @StateObject static var timeSignature: TimeSignature = TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120)
    static var previews: some View {
        MeasureView(
            clefToShow: $clefToShow,
            measureBarVariant: $measureBarVariant,
            keySignatureToShow: $keySignatureToShow,
            isClefVisible: .constant(true),
            timeSignature: timeSignature
        )
            .padding()
    }
}
