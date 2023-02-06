//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/4/23.
//

import SwiftUI

struct KeySignatureView: View {
    var measureSpacing: MeasureSpacing
    @Binding var clefNameVariant: ClefNameVariant
    @Binding var selectedKeySignature: KeySignature
    
    var body: some View {
        
        if selectedKeySignature.numberOfSymbols == 0 {
            EmptyView()
        } else if selectedKeySignature.numberOfSymbols == 1 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsOne(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsOne(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        } else if selectedKeySignature.numberOfSymbols == 2 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsTwo(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsTwo(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        } else if selectedKeySignature.numberOfSymbols == 3 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsThree(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsThree(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        } else if selectedKeySignature.numberOfSymbols == 4 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsFour(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsFour(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        } else if selectedKeySignature.numberOfSymbols == 5 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsFive(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsFive(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        } else if selectedKeySignature.numberOfSymbols == 6 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsSix(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsSix(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        } else if selectedKeySignature.numberOfSymbols == 7 {
            switch selectedKeySignature.keySignatureType {
            case .Sharp:
                SharpsSeven(measureSpacing: measureSpacing, clef: clefNameVariant)
            case .None:
                EmptyView()
            case .Flat:
                FlatsSeven(measureSpacing: measureSpacing, clef: clefNameVariant)
            }
        }
    }
}

struct KeySignatureView_Previews: PreviewProvider {
    static var previews: some View {
        KeySignatureView(measureSpacing: MeasureSpacing(width: 300), clefNameVariant: .constant(.BassClef), selectedKeySignature: .constant(KeySignatures.EFlatMajor))
    }
}
