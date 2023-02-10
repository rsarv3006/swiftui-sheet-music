//
//  File.swift
//  
//
//  Created by Robert J. Sarvis Jr on 2/4/23.
//

import Foundation

public class KeySignatures {
    
    public static let CMajor = KeySignature(displayName: "C Major", id: "CMajor", keySignatureType: .None, numberOfSymbols: 0)
    public static let FMajor = KeySignature(displayName: "F Major", id: "FMajor", keySignatureType: .Flat, numberOfSymbols: 1)
    public static let BFlatMajor = KeySignature(displayName: "Bb Major", id: "BFlatMajor", keySignatureType: .Flat, numberOfSymbols: 2)
    public static let EFlatMajor = KeySignature(displayName: "Eb Major", id: "EFlatMajor", keySignatureType: .Flat, numberOfSymbols: 3)
    public static let AFlatMajor = KeySignature(displayName: "Ab Major", id: "AFlatMajor", keySignatureType: .Flat, numberOfSymbols: 4)
    public static let DFlatMajor = KeySignature(displayName: "Db Major", id: "DFlatMajor", keySignatureType: .Flat, numberOfSymbols: 5)
    public static let GFlatMajor = KeySignature(displayName: "Gb Major", id: "GFlatMajor", keySignatureType: .Flat, numberOfSymbols: 6)
    public static let CFlatMajor = KeySignature(displayName: "Cb Major", id: "CFlatMajor", keySignatureType: .Flat, numberOfSymbols: 7)
    
    // sharps
    public static let GMajor = KeySignature(displayName: "G Major", id: "GMajor", keySignatureType: .Sharp, numberOfSymbols: 1)
    public static let DMajor = KeySignature(displayName: "D Major", id: "DMajor", keySignatureType: .Sharp, numberOfSymbols: 2)
    public static let AMajor = KeySignature(displayName: "A Major", id: "AMajor", keySignatureType: .Sharp, numberOfSymbols: 3)
    public static let EMajor = KeySignature(displayName: "E Major", id: "EMajor", keySignatureType: .Sharp, numberOfSymbols: 4)
    public static let BMajor = KeySignature(displayName: "B Major", id: "BMajor", keySignatureType: .Sharp, numberOfSymbols: 5)
    public static let FSharpMajor = KeySignature(displayName: "F# Major", id: "FSharpMajor", keySignatureType: .Sharp, numberOfSymbols: 6)
    public static let CSharpMajor = KeySignature(displayName: "C# Major", id: "CSharpMajor", keySignatureType: .Sharp, numberOfSymbols: 7)
    
    // minor
    public static let AMinor = KeySignature(displayName: "A Minor", id: "AMinor", keySignatureType: .None, numberOfSymbols: 0)
    public static let DMinor = KeySignature(displayName: "D Minor", id: "DMinor", keySignatureType: .Flat, numberOfSymbols: 1)
    public static let GMinor = KeySignature(displayName: "G Minor", id: "GMinor", keySignatureType: .Flat, numberOfSymbols: 2)
    public static let CMinor = KeySignature(displayName: "C Minor", id: "CMinor", keySignatureType: .Flat, numberOfSymbols: 3)
    public static let FMinor = KeySignature(displayName: "F Minor", id: "FMinor", keySignatureType: .Flat, numberOfSymbols: 4)
    public static let BFlatMinor = KeySignature(displayName: "Bb Minor", id: "BFlatMinor", keySignatureType: .Flat, numberOfSymbols: 5)
    public static let EFlatMinor = KeySignature(displayName: "Eb Minor", id: "EFlatMinor", keySignatureType: .Flat, numberOfSymbols: 6)
    public static let AFlatMinor = KeySignature(displayName: "Ab Minor", id: "AFlatMinor", keySignatureType: .Flat, numberOfSymbols: 7)
    
    // sharps
    public static let EMinor = KeySignature(displayName: "E Minor", id: "EMinor", keySignatureType: .Sharp, numberOfSymbols: 1)
    public static let BMinor = KeySignature(displayName: "B Minor", id: "BMinor", keySignatureType: .Sharp, numberOfSymbols: 2)
    public static let FSharpMinor = KeySignature(displayName: "F# Minor", id: "FSharpMinor", keySignatureType: .Sharp, numberOfSymbols: 3)
    public static let CSharpMinor = KeySignature(displayName: "C# Minor", id: "CSharpMinor", keySignatureType: .Sharp, numberOfSymbols: 4)
    public static let GSharpMinor = KeySignature(displayName: "G# Minor", id: "GSharpMinor", keySignatureType: .Sharp, numberOfSymbols: 5)
    public static let DSharpMinor = KeySignature(displayName: "D# Minor", id: "DSharpMinor", keySignatureType: .Sharp, numberOfSymbols: 6)
    public static let ASharpMinor = KeySignature(displayName: "A# Minor", id: "ASharpMinor", keySignatureType: .Sharp, numberOfSymbols: 7)
    
    public static let Dictionary: [String: KeySignature] = [
        KeySignatures.CMajor.id: KeySignatures.CMajor,
        KeySignatures.FMajor.id: KeySignatures.FMajor,
        KeySignatures.BFlatMajor.id: KeySignatures.BFlatMajor,
        KeySignatures.EFlatMajor.id: KeySignatures.EFlatMajor,
        KeySignatures.AFlatMajor.id: KeySignatures.AFlatMajor,
        KeySignatures.DFlatMajor.id: KeySignatures.DFlatMajor,
        KeySignatures.GFlatMajor.id: KeySignatures.GFlatMajor,
        KeySignatures.CFlatMajor.id: KeySignatures.CFlatMajor,
        
        KeySignatures.GMajor.id: KeySignatures.GMajor,
        KeySignatures.DMajor.id: KeySignatures.DMajor,
        KeySignatures.AMajor.id: KeySignatures.AMajor,
        KeySignatures.EMajor.id: KeySignatures.EMajor,
        KeySignatures.BMajor.id: KeySignatures.BMajor,
        KeySignatures.FSharpMajor.id: KeySignatures.FSharpMajor,
        KeySignatures.CSharpMajor.id: KeySignatures.CSharpMajor,
        
        KeySignatures.AMinor.id: KeySignatures.AMinor,
        KeySignatures.DMinor.id: KeySignatures.DMinor,
        KeySignatures.GMinor.id: KeySignatures.GMinor,
        KeySignatures.CMinor.id: KeySignatures.CMinor,
        KeySignatures.FMinor.id: KeySignatures.FMinor,
        KeySignatures.BFlatMinor.id: KeySignatures.BFlatMinor,
        KeySignatures.EFlatMinor.id: KeySignatures.EFlatMinor,
        KeySignatures.AFlatMinor.id: KeySignatures.AFlatMinor,
        
        KeySignatures.EMinor.id: KeySignatures.EMinor,
        KeySignatures.BMinor.id: KeySignatures.BMinor,
        KeySignatures.FSharpMinor.id: KeySignatures.FSharpMinor,
        KeySignatures.CSharpMinor.id: KeySignatures.CSharpMinor,
        KeySignatures.GSharpMinor.id: KeySignatures.GSharpMinor,
        KeySignatures.DSharpMinor.id: KeySignatures.DSharpMinor,
        KeySignatures.ASharpMinor.id: KeySignatures.ASharpMinor,
    ]
}

public enum KeySignatureType: String, Hashable {
    case Sharp = "Sharp"
    case Flat = "Flat"
    case None = "None"
}

public class KeySignature {
    public let displayName: String
    public let id: String
    public let keySignatureType: KeySignatureType
    public var numberOfSymbols: Int
    
    init(displayName: String, id: String, keySignatureType: KeySignatureType, numberOfSymbols: Int) {
        self.displayName = displayName
        self.id = id
        self.keySignatureType = keySignatureType
        self.numberOfSymbols = numberOfSymbols
    }
}

extension KeySignature: Hashable {
    public static func == (lhs: KeySignature, rhs: KeySignature) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
