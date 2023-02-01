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
        Asset(named: "sign_natural")
            .scaledToFit()
            .frame(height: height)
    }
}

struct NaturalSignNotation_Previews: PreviewProvider {
    static var previews: some View {
        NaturalSignNotation(height: 14)
    }
}
