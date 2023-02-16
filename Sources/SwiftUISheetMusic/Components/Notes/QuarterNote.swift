//
//  QuarterNote.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/15/23.
//

import SwiftUI

struct QuarterNote: View {
    @Binding var height: CGFloat
    @Binding var xPosition: CGFloat
    @Binding var yPosition: CGFloat
    
    var body: some View {
        Text("\u{ECA6}").font(Font.custom("Bravura", size: height * 2))
            .position(x: xPosition, y: yPosition)
            
    }
}

struct QuarterNote_Previews: PreviewProvider {
    static var previews: some View {
        QuarterNote(height: .constant(48), xPosition: .constant(200), yPosition: .constant(200))
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
