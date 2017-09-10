//
//  BTCAddressValidator.swift
//  SwiftBTCAddressValidator
//
//  Created by Emmanuel Francisco Tugado on 8/9/17.
//  Copyright © 2017 Emmanuel Tugado. All rights reserved.
//

import Foundation
import CryptoSwift

public final class BTCAddressValidator {
    private func getBase58DecodeAsBytes(address: String, length: Int) -> [UTF8.CodeUnit]? {
        let b58Chars = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
        
        var output: [UTF8.CodeUnit] = Array(repeating: 0, count: length)
        
        for i in 0..<address.characters.count {
            let index = address.index(address.startIndex, offsetBy: i)
            let charAtIndex = address[index]
            
            guard let charLoc = b58Chars.characters.index(of: charAtIndex) else { continue }
            
            var p = b58Chars.distance(from: b58Chars.startIndex, to: charLoc)
            for j in stride(from: length - 1, through: 0, by: -1) {
                p += 58 * Int(output[j] & 0xFF)
                output[j] = UTF8.CodeUnit(p % 256)
                
                p /= 256
            }
            
            guard p == 0 else { return nil }
        }
        
        return output
    }
    
    func isValid(bitcoinAddress address: String) -> Bool {
        guard address.characters.count >= 26 && address.characters.count <= 35,
            address.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil,
            let decodedAddress = getBase58DecodeAsBytes(address: address, length: 25),
            decodedAddress.count >= 4
            else { return false }
        
        let decodedAddressNoCheckSum = Array(decodedAddress.prefix(decodedAddress.count - 4))
        let hashedSum = decodedAddressNoCheckSum.sha256().sha256()
        
        let checkSum = Array(decodedAddress.suffix(from: decodedAddress.count - 4))
        let hashedSumHeader = Array(hashedSum.prefix(4))
        
        return hashedSumHeader == checkSum
    }
}
