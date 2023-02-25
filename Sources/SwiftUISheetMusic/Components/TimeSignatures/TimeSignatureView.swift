//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/7/23.
//

import SwiftUI
import MusicNotation

struct TimeSignatureView: View {
    private var height: CGFloat
    @ObservedObject private var timeSignature: TimeSignature
    @Binding private var xPosition: CGFloat
    @Binding private var yPosition: CGFloat
    @Binding private var isTimeSignatureVisible: Bool
    
    init(measureSpacing: MeasureSpacing, isClefVisible: Binding<Bool>, numberOfKeySignatureSymbols: Binding<Int>, timeSignature: TimeSignature, isTimeSignatureVisible: Binding<Bool>) {
        self.height = measureSpacing.timeSignatureHeight
        
        var offSet = isClefVisible.wrappedValue ? 7 : 3
        
        
        let topNumberCount = TimeSignatureUtils.convertTimeSignatureToCodes(number: timeSignature.topNumber).count
        
        if (topNumberCount >= 3) {
            offSet += 1
        }
        
        let xMultiplier = CGFloat(offSet + numberOfKeySignatureSymbols.wrappedValue)
        
        self._xPosition = .constant(measureSpacing.spacing * xMultiplier)
        
        self._yPosition = .constant(measureSpacing.line1YTop * 1.23)
        self.timeSignature = timeSignature
        
        self._isTimeSignatureVisible = isTimeSignatureVisible
        
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
        if !topCodes.isEmpty && !bottomCodes.isEmpty && isTimeSignatureVisible {
            VStack (spacing: height * 0.25 * -1) {
                HStack (spacing: 0) {
                    ForEach(topCodes, id: \.self) { element in
                        Text(element).font(Font.custom("Bravura", size: height / 2))
                            .foregroundColor(.ui.black)
                            .frame(height: height / 2)
                    }
                }
                HStack (spacing: 0) {
                    ForEach(bottomCodes, id: \.self) { element in
                        Text(element).font(Font.custom("Bravura", size: height / 2))
                            .foregroundColor(.ui.black)
                            .frame(height: height / 2)
                    }
                }
            }
            .frame(height: height * 0.52)
            .position(x: xPosition, y: yPosition)
        } else {
            EmptyView()
        }
    }
    
}

struct TimeSignatureView_Previews: PreviewProvider {
    @StateObject static var timeSignature = TimeSignature(topNumber: -1, bottomNumber: 4, tempo: 120)
    static var previews: some View {
        TimeSignatureView(measureSpacing: MeasureSpacing(width: 300), isClefVisible: .constant(true), numberOfKeySignatureSymbols: .constant(7), timeSignature: timeSignature, isTimeSignatureVisible: .constant(true))
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
