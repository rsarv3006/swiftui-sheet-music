//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct FlatSignNotation: View {
    let height: CGFloat
    
    init(height: CGFloat) {
        self.height = height
    }
    
    var body: some View {
        Asset(named: "sign_flat")
            .scaledToFit()
            .frame(height: height)
    }
}

struct FlatSignNotation_Previews: PreviewProvider {
    static var previews: some View {
        FlatSignNotation(height: 14)
    }
}
