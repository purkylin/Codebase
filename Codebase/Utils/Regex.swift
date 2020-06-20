//
//  Regex.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import Foundation

class Regex {
    /// Regex match
    ///
    /// - Parameters:
    ///   - pattern: pattern
    ///   - raw: input
    ///   - group: match group index
    static func match(pattern: String, in raw: String, group: Int = 0) throws -> String? {
        let regex = try NSRegularExpression(pattern: pattern, options: [.anchorsMatchLines])
        if let result = regex.firstMatch(in: raw, options: [], range: NSRange(location: 0, length: raw.count)) {
            guard result.numberOfRanges > group else { return nil }
            
            let matchRange = result.range(at: group)
            return raw.substring(in: matchRange.lowerBound..<matchRange.upperBound)
        }
        
        return nil
    }
}

