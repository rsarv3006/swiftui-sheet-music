//
//  SwiftUIView.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/7/23.
//

import SwiftUI

struct TimeSignatureTwoTwo: View {
    @Binding var height: CGFloat
    
    init(height: Binding<CGFloat>) {
        self._height = height
    }
    
    var body: some View {
        Asset(named: "time_signature_2_2")
            .scaledToFit()
            .frame(height: height)
    }

}

struct TimeSignatureTwoTwo_Previews: PreviewProvider {
    static var previews: some View {
        TimeSignatureTwoTwo(height: .constant(64))
    }
}
