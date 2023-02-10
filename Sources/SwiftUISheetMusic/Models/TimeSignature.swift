//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/8/23.
//

import Foundation

public struct TimeSignature {
    let topNumberCodes: [String]
    let bottomNumberCodes: [String]
    
    public init(topNumberCodes: [String], bottomNumberCodes: [String]) {
        self.topNumberCodes = topNumberCodes
        self.bottomNumberCodes = bottomNumberCodes
    }
}
