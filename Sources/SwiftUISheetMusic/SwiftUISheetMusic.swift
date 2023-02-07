import SwiftUI

public struct SwiftUISheetMusic {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

public struct SheetMusicView: View {
    @Binding var clefToShow: ClefNameVariant
    @Binding var measureBarlineVariant: MeasureBarlineVariant
    @Binding var keySignatureToShow: KeySignature
    @Binding var isClefVisible: Bool
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarlineVariant: Binding<MeasureBarlineVariant>, keySignatureToShow: Binding<KeySignature>, isClefVisible: Binding<Bool>) {
        self._clefToShow = clefToShow
        self._measureBarlineVariant = measureBarlineVariant
        self._keySignatureToShow = keySignatureToShow
        self._isClefVisible = isClefVisible
    }
    
    public var body: some View {
        Measure(clefToShow: $clefToShow, measureBarVariant: $measureBarlineVariant, keySignatureToShow: $keySignatureToShow, isClefVisible: $isClefVisible)
            .background(Color.white)
    }
}


