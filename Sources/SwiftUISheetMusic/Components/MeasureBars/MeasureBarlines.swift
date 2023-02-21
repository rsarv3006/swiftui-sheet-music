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
    
    init(measureSpacing: MeasureSpacing, isClefVisible: Binding<Bool>, numberOfKeySignatureSymbols: Binding<Int>) {
        let offSet = isClefVisible.wrappedValue ? 9 : 5
        let beginRepeatBarXOffsetMultiplier = CGFloat(offSet + numberOfKeySignatureSymbols.wrappedValue)
        
        self.measureBarlineUtil = MeasureBarlineUtil(measureSpacing: measureSpacing, beginRepeatBarXOffsetMultiplier: beginRepeatBarXOffsetMultiplier)
        self.measureBarVariant = measureSpacing.measureBarVariant
    }
    
    private var beginRepeatDots: some View {
        ZStack {
            Circle()
                .path(in: CGRect(x: measureBarlineUtil.beginRepeatBarOffset, y: measureBarlineUtil.dotOneYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                .foregroundColor(Color.ui.black)
            Circle()
                .path(in: CGRect(x: measureBarlineUtil.beginRepeatBarOffset, y: measureBarlineUtil.dotTwoYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
        }
    }
    
    private var endRepeatBarDots: some View {
        ZStack {
            Circle()
                .path(in: CGRect(x: measureBarlineUtil.endRepeatBarOffset, y: measureBarlineUtil.dotOneYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                .foregroundColor(Color.ui.black)
            Circle()
                .path(in: CGRect(x: measureBarlineUtil.endRepeatBarOffset, y: measureBarlineUtil.dotTwoYOffset, width: measureBarlineUtil.dotSize, height: measureBarlineUtil.dotSize))
                .foregroundColor(Color.ui.black)
        }
    }
    
    var body: some View {
        ZStack {
            Path { path in
                path.addLines(measureBarlineUtil.pointsArray)
            }
            .foregroundColor(Color.ui.black)
            
            if measureBarVariant == .EndRepeatBar {
                endRepeatBarDots
            } else if measureBarVariant == .BegingAndEndRepeatBars {
                endRepeatBarDots
                beginRepeatDots
                
            } else if measureBarVariant == .BeginRepeatBar {
                beginRepeatDots
            }
        }
    }
}

struct MeasureBarlines_Previews: PreviewProvider {
    @State static var clefToShow: ClefNameVariant = .BassClef
    @State static var measureBarVariant: MeasureBarlineVariant = .BeginRepeatBar
    @State static var keySignatureToShow: KeySignature = KeySignatures.EFlatMajor
    static let measure = Measure(timeSignature: TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120))
    
    static var previews: some View {
        MeasureView(
            clefToShow: $clefToShow,
            measureBarVariant: $measureBarVariant,
            keySignatureToShow: $keySignatureToShow,
            isClefVisible: .constant(true),
            measure: measure
        )
            .padding()
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
