//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/30/23.
//

import Foundation
import SwiftUI

public func Asset(named name: String) -> Image? {
    guard let uiImage = UIImage(named: name, in: Bundle.module, compatibleWith: nil) else { return nil }
    
    return Image(uiImage: uiImage).resizable()
}
