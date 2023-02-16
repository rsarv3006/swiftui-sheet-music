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
    @ObservedObject var score: Score
    
    private var firstPart: Part {
        get {
            let firstPart = score.first { part in
                print("part name: \(part.name)")
                return true
            }
            return firstPart!
        }
    }
    
    private var testStave: Staff {
        get {
            let staveFirstIndex = firstPart.startIndex
            let stave = firstPart[staveFirstIndex]
            return stave
        }
    }
    
    public init(clefToShow: Binding<ClefNameVariant>, measureBarlineVariant: Binding<MeasureBarlineVariant>, keySignatureToShow: Binding<KeySignature>, isClefVisible: Binding<Bool>, timeSignature: TimeSignature, score: Score) {
        self._clefToShow = clefToShow
        self._measureBarlineVariant = measureBarlineVariant
        self._keySignatureToShow = keySignatureToShow
        self._isClefVisible = isClefVisible
        self.timeSignature = timeSignature
        self.score = score
        SwiftUISheetMusic.registerFonts()
    }
    
    public var body: some View {
        MeasureView(clefToShow: $clefToShow, measureBarVariant: $measureBarlineVariant, keySignatureToShow: $keySignatureToShow, isClefVisible: $isClefVisible, timeSignature: timeSignature)
            .background(Color.white)
        Text("\(firstPart.name) - \(firstPart.debugDescription) - \(score.title) - \(testStave.debugDescription)")
    }
}
