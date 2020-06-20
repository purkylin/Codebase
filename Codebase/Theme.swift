//
//  Theme.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/20.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

enum Theme {
    case `default`
    case dark
    
    static var current: Theme = .default
    
    var mainColor: UIColor {
        switch self {
        case .default:
            return .black
        case .dark:
            return .white
        }
    }
    
    func apply() {
        UIApplication.shared.delegate?.window??.tintColor = mainColor
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
    }
}
