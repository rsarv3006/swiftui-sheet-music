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
    
    let staffLinesPointArray: [CGPoint]
    
    let measureHeight: CGFloat
    let clefHeight: CGFloat
    
    let numberOfLegderLines = 9
    
    let measureBarVariant: MeasureBarlineVariant
    
    let timeSignatureHeight: CGFloat
    
    init (width: CGFloat, spacing: CGFloat = 8, measureBarVariant: MeasureBarlineVariant = .SingleBar) {
        self.width = width
        self.spacing = spacing
        self.lineHeight = spacing / 8
        
        self.measureBarVariant = measureBarVariant
        
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
        
        let clefHeight = line4YTop - ledgerLineOffset
        self.clefHeight = clefHeight
        
        let measureLine1PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line1YTop, lineBottom: line1YBottom)
        let measureLine2PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line2YTop, lineBottom: line2YBottom)
        let measureLine3PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line3YTop, lineBottom: line3YBottom)
        let measureLine4PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line4YTop, lineBottom: line4YBottom)
        let measureLine5PointArray = MeasureSpacing.buildLinePointArray(width: width, lineTop: line5YTop, lineBottom: line5YBottom)
        
        self.staffLinesPointArray = measureLine1PointArray + measureLine2PointArray + measureLine3PointArray + measureLine4PointArray + measureLine5PointArray
        
        self.timeSignatureHeight = clefHeight * 2.8
        
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
       
    private static func calculateFirstLineOffsetFromLedger(ledgerLines: Int, spacing: CGFloat, lineHeight: CGFloat) -> CGFloat {
        return CGFloat(ledgerLines) * lineHeight + CGFloat(ledgerLines) * spacing
    }
}
