//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/2/23.
//

import Foundation

struct MeasureBarlineUtil {
    private static let dotOneYOffsetMultiplier: CGFloat = 1.045
    private static let dotTwoYOffsetMultiplier: CGFloat = 1.04
    
    let pointsArray: [CGPoint]
    let endRepeatBarOffset: CGFloat
    let dotOneYOffset: CGFloat
    let dotTwoYOffset: CGFloat
    let dotSize: CGFloat
    
    init(measureSpacing: MeasureSpacing) {
        let endPointArray = MeasureBarlineUtil.buildMeasureEndPointArray(measureBarVariant: measureSpacing.measureBarVariant, width: measureSpacing.width, line1YTop: measureSpacing.line1YTop, line5YBottom: measureSpacing.line5YBottom, lineHeight: measureSpacing.lineHeight)
        let startPointArray = MeasureBarlineUtil.buildMeasureStartPointArray(measureBarVariant: measureSpacing.measureBarVariant)
        
        pointsArray = endPointArray + startPointArray
        
        endRepeatBarOffset = MeasureBarlineUtil.calculateEndRepeatBarDotOffset(width: measureSpacing.width, lineHeight: measureSpacing.lineHeight)
        
        dotOneYOffset = measureSpacing.line2YTop * MeasureBarlineUtil.dotOneYOffsetMultiplier
        dotTwoYOffset = measureSpacing.line3YTop * MeasureBarlineUtil.dotTwoYOffsetMultiplier
        
        dotSize = measureSpacing.spacing / 3
    }
    
    static func calculateEndRepeatBarDotOffset(width: CGFloat, lineHeight: CGFloat) -> CGFloat {
        let wideBarOffset = width - lineHeight * CGFloat(4)
        let spaceOffset = wideBarOffset - lineHeight * CGFloat(3)
        let thinBarOffset = spaceOffset - lineHeight
        
        return thinBarOffset - lineHeight * CGFloat(4)
    }
    
    private static func buildMeasureEndPointArray(measureBarVariant: MeasureBarlineVariant, width: CGFloat, line1YTop: CGFloat, line5YBottom: CGFloat, lineHeight: CGFloat) -> [CGPoint] {
        switch measureBarVariant {
        case .EndRepeatBar:
            let wideBarOffset = width - lineHeight * CGFloat(4)
            let spaceOffset = wideBarOffset - lineHeight * CGFloat(3)
            let thinBarOffset = spaceOffset - lineHeight
            
            return [
                CGPoint(x: wideBarOffset, y: line1YTop),
                CGPoint(x: width, y: line1YTop),
                CGPoint(x: width, y: line5YBottom),
                CGPoint(x: wideBarOffset, y: line5YBottom),
                CGPoint(x: wideBarOffset, y: line1YTop),
                
                CGPoint(x: thinBarOffset, y: line1YTop),
                CGPoint(x: spaceOffset, y: line1YTop),
                CGPoint(x: spaceOffset, y: line5YBottom),
                CGPoint(x: thinBarOffset, y: line5YBottom),
                CGPoint(x: thinBarOffset, y: line1YTop),
            ]
        case .SingleBar:
            return [
                CGPoint(x: width - lineHeight, y: line1YTop),
                CGPoint(x: width, y: line1YTop),
                CGPoint(x: width, y: line5YBottom),
                CGPoint(x: width - lineHeight, y: line5YBottom),
                CGPoint(x: width - lineHeight, y: line1YTop),
            ]
        case .DoubleBar:
            let rightBarOffset = width - lineHeight
            let spaceOffset = rightBarOffset - lineHeight * CGFloat(3)
            let leftBarOffset = spaceOffset - lineHeight
            return [
                CGPoint(x: rightBarOffset, y: line1YTop),
                CGPoint(x: width, y: line1YTop),
                CGPoint(x: width, y: line5YBottom),
                CGPoint(x: rightBarOffset, y: line5YBottom),
                CGPoint(x: rightBarOffset, y: line1YTop),
                
                CGPoint(x: leftBarOffset, y: line1YTop),
                CGPoint(x: spaceOffset, y: line1YTop),
                CGPoint(x: spaceOffset, y: line5YBottom),
                CGPoint(x: leftBarOffset, y: line5YBottom),
                CGPoint(x: leftBarOffset, y: line1YTop),
            ]
            
        case .EndBar:
            let wideBarOffset = width - lineHeight * CGFloat(4)
            let spaceOffset = wideBarOffset - lineHeight * CGFloat(3)
            let thinBarOffset = spaceOffset - lineHeight
            return [
                
                CGPoint(x: wideBarOffset, y: line1YTop),
                CGPoint(x: width, y: line1YTop),
                CGPoint(x: width, y: line5YBottom),
                CGPoint(x: wideBarOffset, y: line5YBottom),
                CGPoint(x: wideBarOffset, y: line1YTop),
                
                CGPoint(x: thinBarOffset, y: line1YTop),
                CGPoint(x: spaceOffset, y: line1YTop),
                CGPoint(x: spaceOffset, y: line5YBottom),
                CGPoint(x: thinBarOffset, y: line5YBottom),
                CGPoint(x: thinBarOffset, y: line1YTop),
            ]
        case .BeginRepeatBar:
            fatalError("Not Implemented")
            
        }
    }
    
    private static func buildMeasureStartPointArray(measureBarVariant: MeasureBarlineVariant) -> [CGPoint] {
        if measureBarVariant == .BeginRepeatBar {
            fatalError("Begin repeat not implemented")
        }
        return []
    }
}
