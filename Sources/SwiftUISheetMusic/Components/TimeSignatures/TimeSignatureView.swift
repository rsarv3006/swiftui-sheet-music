//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/7/23.
//

import SwiftUI
import MusicNotation

struct TimeSignatureView: View {
    @Binding var height: CGFloat
    @ObservedObject private var timeSignature: TimeSignature
    @Binding var xPosition: CGFloat
    @Binding var yPosition: CGFloat
    
    init(measureSpacing: MeasureSpacing, isClefVisible: Binding<Bool>, numberOfKeySignatureSymbols: Binding<Int>, timeSignature: TimeSignature) {
        self._height = .constant(measureSpacing.timeSignatureHeight)
        
        let offSet = isClefVisible.wrappedValue ? 7 : 3
        let xMultiplier = CGFloat(offSet + numberOfKeySignatureSymbols.wrappedValue)
        
        self._xPosition = .constant(measureSpacing.spacing * xMultiplier)
        
        self._yPosition = .constant(measureSpacing.line1YTop * 1.23)
        self.timeSignature = timeSignature
        
    }
    
    private var topCodes: [String] {
        get {
            return TimeSignatureUtils.convertTimeSignatureToCodes(number: $timeSignature.topNumber.wrappedValue)
        }
    }
    
    private var bottomCodes: [String] {
        get {
            return TimeSignatureUtils.convertTimeSignatureToCodes(number: $timeSignature.bottomNumber.wrappedValue)
        }
    }
    
    var body: some View {
        VStack (spacing: height * 0.25 * -1) {
            HStack (spacing: 0) {
                ForEach(topCodes, id: \.self) { element in
                    Text(element).font(Font.custom("Bravura", size: height / 2))
                        .frame(height: height / 2)
                }
            }
            HStack (spacing: 0) {
                ForEach(bottomCodes, id: \.self) { element in
                    Text(element).font(Font.custom("Bravura", size: height / 2))
                        .frame(height: height / 2)
                }
            }
        }
        .frame(height: height * 0.52)
        .position(x: xPosition, y: yPosition)
    }
    
}

struct TimeSignatureView_Previews: PreviewProvider {
    @StateObject static var timeSignature = TimeSignature(topNumber: -1, bottomNumber: 4, tempo: 120)
    static var previews: some View {
        TimeSignatureView(measureSpacing: MeasureSpacing(width: 300), isClefVisible: .constant(true), numberOfKeySignatureSymbols: .constant(7), timeSignature: timeSignature)
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
