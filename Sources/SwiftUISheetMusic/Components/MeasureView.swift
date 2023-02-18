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
    @ObservedObject private var timeSignature: TimeSignature
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarVariant: Binding<MeasureBarlineVariant>, keySignatureToShow: Binding<KeySignature>, isClefVisible: Binding<Bool>, timeSignature: TimeSignature) {
        self._clefToShow = clefToShow
        self._measureBarVariant = measureBarVariant
        self._keySignatureToShow = keySignatureToShow
        self._isClefVisible = isClefVisible
        self.timeSignature = timeSignature
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
                    
                    TimeSignatureView(measureSpacing: measureSpacing, isClefVisible: $isClefVisible, numberOfKeySignatureSymbols: $keySignatureToShow.numberOfSymbols, timeSignature: timeSignature)
                    
                    ClefViewForMeasure(clefToShow: clefToShow, measureSpacing: measureSpacing, isClefVisible: isClefVisible)
                    
                    KeySignatureView(measureSpacing: measureSpacing, clefNameVariant: $clefToShow, selectedKeySignature: $keySignatureToShow, isClefVisible: $isClefVisible)
                    
                    MeasureBarlines(measureSpacing: measureSpacing, isClefVisible: $isClefVisible, numberOfKeySignatureSymbols: $keySignatureToShow.numberOfSymbols)
                    
                    WholeNote(height: .constant(measureNoteAlignment.wholeNoteHeight), xPosition: .constant(measureSpacing.spacing * 24), yPosition: .constant(measureNoteAlignment.space5YPosition))
                }
            }.frame(width: width, height: measureSpacing.measureHeight)
        }
    }
}

public struct MyView: View {
    public init() {}

    public var body: some View {
        Text("Hello, world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var timeSignature = TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120)
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                MeasureView(clefToShow: .constant(.TrebleClef), measureBarVariant: .constant(.BegingAndEndRepeatBars), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), timeSignature: timeSignature
                )
                MeasureView(clefToShow: .constant(.BassClef), measureBarVariant: .constant(.EndBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), timeSignature: timeSignature
                )
            }.padding()
            
            HStack (spacing: 0) {
                MeasureView(clefToShow: .constant(.TenorClef), measureBarVariant: .constant(.SingleBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), timeSignature: timeSignature
                )
                MeasureView(clefToShow: .constant(.AltoClef), measureBarVariant: .constant(.EndBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true), timeSignature: timeSignature
                )
            }.padding()
        }
        .onLoad {
            SwiftUISheetMusic.registerFonts()
        }
    }
}
