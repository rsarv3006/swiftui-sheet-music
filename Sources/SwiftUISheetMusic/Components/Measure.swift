//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/29/23.
//

import SwiftUI

public struct Measure: View {
    @Binding private var clefToShow: ClefNameVariant
    @Binding private var measureBarVariant: MeasureBarlineVariant
    @Binding private var keySignatureToShow: KeySignature
    @Binding private var isClefVisible: Bool
    @Binding private var timeSignature: TimeSignature
    
    private var timeSignatureXPostionMultiplier: CGFloat {
        get {
            let offSet = isClefVisible ? 7 : 3
            return CGFloat(offSet + keySignatureToShow.numberOfSymbols)
        }
    }
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarVariant: Binding<MeasureBarlineVariant>, keySignatureToShow: Binding<KeySignature>, isClefVisible: Binding<Bool>, timeSignature: Binding<TimeSignature>) {
        self._clefToShow = clefToShow
        self._measureBarVariant = measureBarVariant
        self._keySignatureToShow = keySignatureToShow
        self._isClefVisible = isClefVisible
        self._timeSignature = timeSignature
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let measureSpacing = MeasureSpacing(width: width, spacing:8, measureBarVariant: measureBarVariant)
            VStack {
                ZStack {
                    Path { path in
                        path.addLines(measureSpacing.measureLine1PointArray)
                        
                        path.addLines(measureSpacing.measureLine2PointArray)
                        
                        path.addLines(measureSpacing.measureLine3PointArray)
                        
                        path.addLines(measureSpacing.measureLine4PointArray)
                        
                        path.addLines(measureSpacing.measureLine5PointArray)
                    }
                    .foregroundColor(Color.ui.black)
                    
                    TimeSignatureView(measureSpacing: measureSpacing, isClefVisible: $isClefVisible, timeSignature: $timeSignature, numberOfKeySignatureSymbols: $keySignatureToShow.numberOfSymbols.wrappedValue)
                    
                    ClefViewForMeasure(clefToShow: clefToShow, measureSpacing: measureSpacing, isClefVisible: isClefVisible)
                    
                    KeySignatureView(measureSpacing: measureSpacing, clefNameVariant: $clefToShow, selectedKeySignature: $keySignatureToShow, isClefVisible: $isClefVisible)
                    
                    MeasureBarlines(measureSpacing: measureSpacing)
                }
            }.frame(width: width, height: measureSpacing.measureHeight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                Measure(clefToShow: .constant(.TrebleClef), measureBarVariant: .constant(.SingleBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true),
                        timeSignature: .constant(TimeSignature(topNumberCodes: [TimeSignatureNumbersMap.Four], bottomNumberCodes: [TimeSignatureNumbersMap.Four]))
                )
                Measure(clefToShow: .constant(.BassClef), measureBarVariant: .constant(.EndBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true),
                        timeSignature: .constant(TimeSignature(topNumberCodes: [TimeSignatureNumbersMap.Four], bottomNumberCodes: [TimeSignatureNumbersMap.Four])))
            }.padding()
            
            HStack (spacing: 0) {
                Measure(clefToShow: .constant(.TenorClef), measureBarVariant: .constant(.SingleBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true),
                        timeSignature: .constant(TimeSignature(topNumberCodes: [TimeSignatureNumbersMap.Four], bottomNumberCodes: [TimeSignatureNumbersMap.Four])))
                Measure(clefToShow: .constant(.AltoClef), measureBarVariant: .constant(.EndBar), keySignatureToShow: .constant(KeySignatures.ASharpMinor), isClefVisible: .constant(true),
                        timeSignature: .constant(TimeSignature(topNumberCodes: [TimeSignatureNumbersMap.Four], bottomNumberCodes: [TimeSignatureNumbersMap.Four])))
            }.padding()
        }
        .onLoad {
            SwiftUISheetMusic.registerFonts()
        }
    }
}
