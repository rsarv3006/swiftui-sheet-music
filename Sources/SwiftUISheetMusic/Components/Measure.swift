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
            let measureSpacing = MeasureSpacing(width: width, spacing:8, numberOfLegderLines: 9, measureBarVariant: measureBarVariant)
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
                    
                    if clefToShow == .BassClef {
                        BassClef(measureSpacing: measureSpacing)
                    } else if clefToShow == .TrebleClef {
                        TrebleClef(measureSpacing: measureSpacing)
                    } else if clefToShow == .TenorClef {
                        Asset(named: clefToShow.rawValue)
                            .scaledToFit()
                            .frame(height: measureSpacing.clefHeight + measureSpacing.spacing * 1.5)
                            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line2YTop)
                    } else if clefToShow == .AltoClef {
                        Asset(named: clefToShow.rawValue)
                            .scaledToFit()
                            .frame(height: measureSpacing.clefHeight + measureSpacing.spacing * 1.5)
                            .position(x: measureSpacing.spacing * 2, y: measureSpacing.line3YTop)
                    }

                }
            }.frame(width: width, height: measureSpacing.measureHeight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HStack (spacing: 0) {
            Measure(clefToShow: .BassClef)

        }.padding()
    }
}
