import SwiftUI
import MusicNotation

public struct SwiftUISheetMusic {
    public private(set) var text = "Hello, World!"

    public static func registerFonts() {
        registerFont(bundle: .module, fontName: "Bravura", fontExtension: "otf")
        registerFont(bundle: .module, fontName: "BravuraText", fontExtension: "otf")
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        bundle.url(forResource: fontName, withExtension: fontExtension)

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
                fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
    public init() {
    }
}

public struct SheetMusicView: View {
    @Binding var clefToShow: ClefNameVariant
    @Binding var measureBarlineVariant: MeasureBarlineVariant
    @Binding var keySignatureToShow: KeySignature
    @Binding var isClefVisible: Bool
    @ObservedObject var timeSignature: TimeSignature
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarlineVariant: Binding<MeasureBarlineVariant>, keySignatureToShow: Binding<KeySignature>, isClefVisible: Binding<Bool>, timeSignature: TimeSignature) {
        self._clefToShow = clefToShow
        self._measureBarlineVariant = measureBarlineVariant
        self._keySignatureToShow = keySignatureToShow
        self._isClefVisible = isClefVisible
        self.timeSignature = timeSignature
        SwiftUISheetMusic.registerFonts()
    }
    
    public var body: some View {
        MeasureView(clefToShow: $clefToShow, measureBarVariant: $measureBarlineVariant, keySignatureToShow: $keySignatureToShow, isClefVisible: $isClefVisible, timeSignature: timeSignature)
            .background(Color.white)
    }
}


