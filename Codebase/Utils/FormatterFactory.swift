//
//  FormatterFactory.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/20.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import Foundation

struct DateFormatterFactory {
    static let long: DateFormatter = makeShortDateFormatter()
    static let day: DateFormatter = makeDayDateFormatter()
    static let time: DateFormatter = makeTimeDateFormatter()
    
    private static func makeShortDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }
    
    private static func makeDayDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    private static func makeTimeDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
}
