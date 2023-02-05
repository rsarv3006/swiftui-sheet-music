//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/1/23.
//

import SwiftUI

struct PercussionClef: View {
    private let measureSpacing: MeasureSpacing
    
    init(measureSpacing: MeasureSpacing) {
        self.measureSpacing = measureSpacing
    }
    
    var body: some View {
        Asset(named: ClefNameVariant.PercussionClef.rawValue)
            .scaledToFit()
            .frame(height: measureSpacing.clefHeight - measureSpacing.spacing * 1.15)
            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line3YTop * 1.008)
    }
}

struct PercussionClef_Previews: PreviewProvider {
    @State static var clefToShow: ClefNameVariant = .PercussionClef
    
    static var previews: some View {
        HStack (spacing: 0) {
            Measure(clefToShow: $clefToShow)
        }.padding()
    }
}
