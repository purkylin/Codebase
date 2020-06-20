//
//  CellReuseIdentifier.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

protocol CellReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: CellReuseIdentifier { }
extension UICollectionViewCell: CellReuseIdentifier { }

extension CellReuseIdentifier {
    static var reuseIdentifier: String {
        return String(reflecting: self)
    }
}
