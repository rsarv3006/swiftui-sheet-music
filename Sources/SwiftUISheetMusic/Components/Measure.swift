//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/29/23.
//

import SwiftUI

public struct Measure: View {
    @Binding private var clefToShow: ClefNameVariant
    private var measureBarVariant: MeasureBarlineVariant = .SingleBar
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarVariant: MeasureBarlineVariant = .SingleBar) {
        self._clefToShow = clefToShow
        self.measureBarVariant = measureBarVariant
        
    }
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let measureSpacing = MeasureSpacing(width: width, spacing:8, measureBarVariant: measureBarVariant)
            VStack {
                ZStack {
                    Path { path in
                        path.addLines(measureSpacing.measureLine1PointArray)
                        
                        path.addLines(measureSpacing.measureLine2PointArray)
                        
                        path.addLines(measureSpacing.measureLine3PointArray)
                        
                        path.addLines(measureSpacing.measureLine4PointArray)
                        
                        path.addLines(measureSpacing.measureLine5PointArray)
                    }
                    
                    ClefViewForMeasure(clefToShow: clefToShow, measureSpacing: measureSpacing)
                    
                    FlatsSeven(measureSpacing: measureSpacing, clef: clefToShow)
                    
                    MeasureBarlines(measureSpacing: measureSpacing)

                }
            }.frame(width: width, height: measureSpacing.measureHeight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                Measure(clefToShow: .constant(.TrebleClef))
                Measure(clefToShow: .constant(.BassClef))
            }.padding()
            
            HStack (spacing: 0) {
                Measure(clefToShow: .constant(.TenorClef))
                Measure(clefToShow: .constant(.AltoClef))
            }.padding()
        }
    }
}
