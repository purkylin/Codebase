//
//  URL+Util.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import Foundation

extension URL {
    var isDirectory: Bool {
        var _isDirectory: ObjCBool = ObjCBool(false)
        let exists = FileManager.default.fileExists(atPath: self.path, isDirectory: &_isDirectory)
        return exists && _isDirectory.boolValue
    }
}
