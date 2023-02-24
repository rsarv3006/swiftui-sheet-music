//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct NaturalSignNotation: View {
    let height: CGFloat
    
    init(height: CGFloat) {
        self.height = height
    }
    
    var body: some View {
        Text("\u{266E}").font(Font.custom("Bravura", size: height * 1.5)).foregroundColor(.ui.black)
    }
}
