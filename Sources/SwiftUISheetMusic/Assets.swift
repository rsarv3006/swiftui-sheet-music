//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 1/30/23.
//

import Foundation
import SwiftUI

public func Asset(named name: String) -> Image? {    
    return Image(name, bundle: Bundle.module).resizable()
}
