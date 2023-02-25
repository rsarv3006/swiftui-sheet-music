//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/29/23.
//

import SwiftUI
import MusicNotation

public struct MeasureView: View {
    @Binding private var clefToShow: ClefNameVariant
    @Binding private var measureBarVariant: MeasureBarlineVariant
    @Binding private var keySignatureToShow: KeySignature
    @Binding private var isClefVisible: Bool
    @Binding private var isTimeSignatureVisible: Bool
    
    private var measure: ImmutableMeasure
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarVariant: Binding<MeasureBarlineVariant>, keySignatureToShow: Binding<KeySignature>, isClefVisible: Binding<Bool>, measure: ImmutableMeasure, isTimeSignatureVisible: Binding<Bool>) {
        self._clefToShow = clefToShow
        self._measureBarVariant = measureBarVariant
        self._keySignatureToShow = keySignatureToShow
        self._isClefVisible = isClefVisible
        self.measure = measure
        self._isTimeSignatureVisible = isTimeSignatureVisible
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let measureSpacing = MeasureSpacing(width: width, spacing:8, measureBarVariant: measureBarVariant)
            let measureNoteAlignment = MeasureNoteAlignment(measureSpacing: measureSpacing)
            
            VStack {
                ZStack {
                    Path { path in
                        path.addLines(measureSpacing.staffLinesPointArray)
                    }
                    .foregroundColor(Color.ui.black)
                    
                    TimeSignatureView(measureSpacing: measureSpacing, isClefVisible: $isClefVisible, numberOfKeySignatureSymbols: $keySignatureToShow.numberOfSymbols, timeSignature: measure.timeSignature, isTimeSignatureVisible: $isTimeSignatureVisible)
                    
                    ClefViewForMeasure(clefToShow: clefToShow, measureSpacing: measureSpacing, isClefVisible: isClefVisible)
                    
                    KeySignatureView(measureSpacing: measureSpacing, clefNameVariant: $clefToShow, selectedKeySignature: $keySignatureToShow, isClefVisible: $isClefVisible)
                    
                    MeasureBarlines(measureSpacing: measureSpacing, isClefVisible: $isClefVisible, numberOfKeySignatureSymbols: $keySignatureToShow.numberOfSymbols)
                    
                    WholeNote(height: .constant(measureNoteAlignment.wholeNoteHeight), xPosition: .constant(measureSpacing.spacing * 24), yPosition: .constant(measureNoteAlignment.space5YPosition))
                }
            }.frame(width: width, height: measureSpacing.measureHeight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let measure = Measure(timeSignature: TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120))
    
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                MeasureView(clefToShow: .constant(.TrebleClef), measureBarVariant: .constant(.BegingAndEndRepeatBars), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), measure: measure, isTimeSignatureVisible: .constant(true)
                )
                MeasureView(clefToShow: .constant(.BassClef), measureBarVariant: .constant(.EndBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), measure: measure, isTimeSignatureVisible: .constant(true)
                )
            }.padding()
            
            HStack (spacing: 0) {
                MeasureView(clefToShow: .constant(.TenorClef), measureBarVariant: .constant(.SingleBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), measure: measure, isTimeSignatureVisible: .constant(true)
                )
                MeasureView(clefToShow: .constant(.AltoClef), measureBarVariant: .constant(.EndBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), measure: measure, isTimeSignatureVisible: .constant(true)
                )
            }.padding()
        }
        .onLoad {
            SwiftUISheetMusic.registerFonts()
        }
    }
}
