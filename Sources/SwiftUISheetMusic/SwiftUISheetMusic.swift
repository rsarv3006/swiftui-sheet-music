import SwiftUI

public struct SwiftUISheetMusic {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

public struct SheetMusicView: View {
    @Binding var clefToShow: ClefNameVariant
    
    public init(clefToShow: Binding<ClefNameVariant>) {
        self._clefToShow = clefToShow
    }
    
    public var body: some View {
        VStack {
            Text("Howdy Howdy")
            Measure(clefToShow: $clefToShow)
        }
        .padding()
    }
}


