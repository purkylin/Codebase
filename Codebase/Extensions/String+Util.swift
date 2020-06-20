//
//  String+Util.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    /// Substring of range
    func substring(in range: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
    
    // Validate range
    func valid(range: Range<Int>) -> Bool {
        return range.lowerBound >= 0 && range.upperBound <= self.count
    }
    
    /// Calculate md5 hash
    func md5() -> String {
        let data = Data(utf8)
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        data.withUnsafeBytes { buffer in
            _ = CC_MD5(buffer.baseAddress, CC_LONG(buffer.count), &hash)
        }
        
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
    
    func base64() -> String {
        return self.data(using: .utf8)!.base64EncodedString()
    }
}
