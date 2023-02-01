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
        Asset(named: "sign_sharp")
            .scaledToFit()
            .frame(height: height)
    }
}

struct SharpSignNotation_Previews: PreviewProvider {
    static var previews: some View {
        SharpSignNotation(height: 14)
    }
}
