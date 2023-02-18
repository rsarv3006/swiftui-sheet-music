//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/7/23.
//

import SwiftUI

private struct LogicLoader<T>: View where T: View {
    private var content: T
    
    init(_ closure: () -> Void, content: T) {
        closure()
        self.content = content
    }
    
    var body: some View {
        content
    }
}

extension View {
    func onLoad(_ closure: () -> Void) -> some View {
        LogicLoader(
            closure,
            content: self
        )
    }
}
