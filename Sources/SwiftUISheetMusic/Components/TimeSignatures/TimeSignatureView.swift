//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/7/23.
//

import SwiftUI

struct TimeSignatureView: View {
    @Binding var height: CGFloat
    @Binding var timeSignature: TimeSignature
    @Binding var xPosition: CGFloat
    @Binding var yPosition: CGFloat
    
    init(height: Binding<CGFloat>, timeSignature: Binding<TimeSignature>, xPosition: Binding<CGFloat>, yPosition: Binding<CGFloat>) {
        self._height = height
        self._timeSignature = timeSignature
        self._xPosition = xPosition
        self._yPosition = yPosition
    }
    
    init(measureSpacing: MeasureSpacing, isClefVisible: Binding<Bool>, timeSignature: Binding<TimeSignature>, numberOfKeySignatureSymbols: Int) {
        self._height = .constant(measureSpacing.timeSignatureHeight)
        self._timeSignature = timeSignature
        
        let offSet = isClefVisible.wrappedValue ? 7 : 3
        let xMultiplier = CGFloat(offSet + numberOfKeySignatureSymbols)
        
        self._xPosition = .constant(measureSpacing.spacing * xMultiplier)
        
        self._yPosition = .constant(measureSpacing.line1YTop * 1.23)
    }
    
    var body: some View {
        VStack (spacing: height * 0.25 * -1) {
            HStack {
                ForEach(timeSignature.topNumberCodes, id: \.self) { element in
                    Text(element).font(Font.custom("Bravura", size: height / 2))
                        .frame(height: height / 2)
                }
            }
            HStack {
                ForEach(timeSignature.bottomNumberCodes, id: \.self) { element in
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
    static var previews: some View {
        TimeSignatureView(height: .constant(256), timeSignature: .constant(TimeSignature(topNumberCodes: [TimeSignatureNumbersMap.Four], bottomNumberCodes: [TimeSignatureNumbersMap.Four])),
                          xPosition: .constant(120),
                          yPosition: .constant(120)
        )
        .onLoad {
            SwiftUISheetMusic.registerFonts()
        }
    }
}
