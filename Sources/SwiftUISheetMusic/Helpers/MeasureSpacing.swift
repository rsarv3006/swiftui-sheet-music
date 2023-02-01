//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/29/23.
//

import Foundation

public struct MeasureSpacing {
    let spacing: CGFloat
    let width: CGFloat
    let lineHeight: CGFloat
    
    let line1YTop: CGFloat
    let line2YTop: CGFloat
    let line3YTop: CGFloat
    let line4YTop: CGFloat
    let line5YTop: CGFloat
    
    let line1YBottom: CGFloat
    let line2YBottom: CGFloat
    let line3YBottom: CGFloat
    let line4YBottom: CGFloat
    let line5YBottom: CGFloat
    
    let measureStartPointArray: [CGPoint]
    let measureEndPointArray: [CGPoint]
    
    let measureLine1PointArray: [CGPoint]
    let measureLine2PointArray: [CGPoint]
    let measureLine3PointArray: [CGPoint]
    let measureLine4PointArray: [CGPoint]
    let measureLine5PointArray: [CGPoint]
    
    let measureHeight: CGFloat
    let clefHeight: CGFloat

    init (width: CGFloat, spacing: CGFloat = 8, numberOfLegderLines: Int = 0, measureBarVariant: MeasureBarlineVariant = .SingleBar) {
        self.width = width
        self.spacing = spacing
        self.lineHeight = spacing / 8
        
        let ledgerLineOffset = MeasureSpacing.calculateFirstLineOffsetFromLedger(ledgerLines: numberOfLegderLines, spacing: spacing, lineHeight: lineHeight)
        
        self.line1YTop = ledgerLineOffset
        self.line1YBottom = line1YTop + lineHeight

        self.line2YTop = line1YBottom + spacing
        self.line2YBottom = line2YTop + lineHeight

        self.line3YTop = line2YBottom + spacing
        self.line3YBottom = line3YTop + lineHeight
        
        self.line4YTop = line3YBottom + spacing
        self.line4YBottom = line4YTop + lineHeight
        
        self.line5YTop = line4YBottom + spacing
        self.line5YBottom = line5YTop + lineHeight
        
        self.measureHeight = line5YBottom + ledgerLineOffset
        
        self.clefHeight = line4YTop - ledgerLineOffset
        
        self.measureLine1PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line1YTop, lineBottom: line1YBottom)
        self.measureLine2PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line2YTop, lineBottom: line2YBottom)
        self.measureLine3PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line3YTop, lineBottom: line3YBottom)
        self.measureLine4PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line4YTop, lineBottom: line4YBottom)
        self.measureLine5PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line5YTop, lineBottom: line5YBottom)
        
        self.measureEndPointArray = MeasureSpacing.buildMeasureEndPointArray(measureBarVariant: measureBarVariant, width: width, line1YTop: line1YTop, line5YBottom: line5YBottom, lineHeight: lineHeight)
        
        self.measureStartPointArray = MeasureSpacing.buildMeasureStartPointArray(measureBarVariant: measureBarVariant)
    }
    
    private static func buildLinePointArray(width: CGFloat, lineTop: CGFloat, lineBottom: CGFloat) -> [CGPoint] {
        return [
            CGPoint(x: 0, y: lineTop),
            CGPoint(x: width, y: lineTop),
            CGPoint(x: width, y: lineBottom),
            CGPoint(x: 0, y: lineBottom),
            CGPoint(x: 0, y: lineTop),
        ]
    }
    
    private static func buildMeasureEndPointArray(measureBarVariant: MeasureBarlineVariant, width: CGFloat, line1YTop: CGFloat, line5YBottom: CGFloat, lineHeight: CGFloat) -> [CGPoint]{
        switch measureBarVariant {
        case .EndRepeatBar:
            fatalError("End repeat not implemented")
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
        return []
    }
    
    private static func buildMeasureStartPointArray(measureBarVariant: MeasureBarlineVariant) -> [CGPoint] {
        if measureBarVariant == .BeginRepeatBar {
            fatalError("Begin repeat not implemented")
        }
        return []
    }
    
    private static func calculateFirstLineOffsetFromLedger(ledgerLines: Int, spacing: CGFloat, lineHeight: CGFloat) -> CGFloat {
        return CGFloat(ledgerLines) * lineHeight + CGFloat(ledgerLines) * spacing
    }
}
