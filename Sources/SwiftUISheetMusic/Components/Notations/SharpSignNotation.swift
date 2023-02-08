//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct SharpSignNotation: View {
    let height: CGFloat
    
    init(height: CGFloat) {
        self.height = height
    }
    
    var body: some View {
        Text("\u{266F}").font(Font.custom("Bravura", size: height * 1.5))
    }
}

struct SharpSignNotation_Previews: PreviewProvider {
    static var previews: some View {
        SharpSignNotation(height: 140)
            .onLoad {
                SwiftUISheetMusic.registerFonts()
            }
    }
}
