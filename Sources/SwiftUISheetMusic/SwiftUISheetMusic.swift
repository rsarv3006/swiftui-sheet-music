import SwiftUI

public struct SwiftUISheetMusic {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

public struct SheetMusicView: View {
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            Text("Howdy Howdy")
            Measure(clefToShow: .BassClef)
        }
        .padding()
    }
}


