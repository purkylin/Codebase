//
//  UIColor+Util.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let input = hex.replacingOccurrences(of: "#", with: "")
        guard let n = Int(input, radix: 16) else { fatalError("Invalid color") }
        
        let r = CGFloat((n >> 16) & 0xff) / 255.0
        let g = CGFloat((n >> 8) & 0xff) / 255.0
        let b = CGFloat((n >> 0) & 0xff) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
