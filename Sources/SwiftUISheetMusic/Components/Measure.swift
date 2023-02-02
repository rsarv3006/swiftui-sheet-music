//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/29/23.
//

import SwiftUI

public struct Measure: View {
    private var clefToShow: ClefNameVariant = .none
    private var measureBarVariant: MeasureBarlineVariant = .SingleBar
    
    public init(clefToShow: ClefNameVariant = .none, measureBarVariant: MeasureBarlineVariant = .SingleBar) {
        self.clefToShow = clefToShow
        self.measureBarVariant = measureBarVariant
        
    }
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let measureSpacing = MeasureSpacing(width: width, spacing:12, numberOfLegderLines: 9, measureBarVariant: measureBarVariant)
            VStack {
                ZStack {
                    Path { path in
                        path.addLines(measureSpacing.measureLine1PointArray)
                        
                        path.addLines(measureSpacing.measureLine2PointArray)
                        
                        path.addLines(measureSpacing.measureLine3PointArray)
                        
                        path.addLines(measureSpacing.measureLine4PointArray)
                        
                        path.addLines(measureSpacing.measureLine5PointArray)
                        
                        path.addLines(measureSpacing.measureEndPointArray)
                        
                        path.addLines(measureSpacing.measureStartPointArray)
                    }
                    
                    ClefViewForMeasure(clefToShow: clefToShow, measureSpacing: measureSpacing)
                    
                    SharpsOne(measureSpacing: measureSpacing, clef: clefToShow)

                }
            }.frame(width: width, height: measureSpacing.measureHeight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack (spacing: 0) {
                Measure(clefToShow: .TrebleClef)
                Measure(clefToShow: .BassClef)
            }.padding()
            
            HStack (spacing: 0) {
                Measure(clefToShow: .TenorClef)
                Measure(clefToShow: .AltoClef)
            }.padding()
        }
    }
}
