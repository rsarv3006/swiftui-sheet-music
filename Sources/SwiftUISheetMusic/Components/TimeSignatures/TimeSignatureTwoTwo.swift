//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/7/23.
//

import SwiftUI

struct TimeSignatureTwoTwo: View {
    @Binding var height: CGFloat
    
    init(height: Binding<CGFloat>) {
        self._height = height
    }
    
    var body: some View {
        VStack (spacing: height * 0.25 * -1) {
            Text("\u{E082}").font(Font.custom("Bravura", size: height / 2))
                .frame(height: height / 2)
            Text("\u{E082}").font(Font.custom("Bravura", size: height / 2))
                .frame(height: height / 2)
        }
        .frame(height: height * 0.52)
    }

}

struct TimeSignatureTwoTwo_Previews: PreviewProvider {
    static var previews: some View {
        TimeSignatureTwoTwo(height: .constant(256))
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
