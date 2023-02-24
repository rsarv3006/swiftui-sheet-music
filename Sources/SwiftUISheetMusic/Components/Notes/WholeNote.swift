//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/13/23.
//

import SwiftUI

struct WholeNote: View {
    @Binding var height: CGFloat
    @Binding var xPosition: CGFloat
    @Binding var yPosition: CGFloat
    
    var body: some View {
        Text("\u{ECA2}").font(Font.custom("Bravura", size: height * 2))
            .foregroundColor(.ui.black)
            .position(x: xPosition, y: yPosition)
            
    }
}

struct WholeNote_Previews: PreviewProvider {
    static var previews: some View {
        WholeNote(height: .constant(48), xPosition: .constant(200), yPosition: .constant(200))
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
