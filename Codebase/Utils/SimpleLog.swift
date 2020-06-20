//
//  SimpleLog.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/20.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import Foundation

class SimpleLog {
    enum LogLevel: Int, CustomStringConvertible {
        case verbose
        case info
        case warn
        case error
        
        var description: String {
            switch self {
            case .verbose:
                return "VERBOSE"
            case .info:
                return "INFO"
            case .warn:
                return "WARN"
            case .error:
                return "ERROR"
            }
        }
    }
    
    public static var `default`: SimpleLog = {
        let instance = SimpleLog()
        instance.addHandler(ConsoleLogHandler())
        return instance
    }()
    
    private let name: String
    private var level: LogLevel = .info
    private var handlers: [LogHandler] = []
    
    init(name: String = "slog") {
        self.name = name
    }
    
    public func addHandler(_ handler: LogHandler) {
        handlers.append(handler)
    }
    
    public func verbose(_ string: String) {
        guard level.rawValue >= LogLevel.verbose.rawValue else { return }
        handlers.forEach { $0.output(string, .verbose, name) }
    }
    
    public func info(_ string: String) {
        guard level.rawValue >= LogLevel.info.rawValue else { return }
        handlers.forEach { $0.output(string, .info, name) }
    }
    
    public func warn(_ string: String) {
        guard level.rawValue >= LogLevel.warn.rawValue else { return }
        handlers.forEach { $0.output(string, .warn, name) }
    }
    
    public func error(_ string: String) {
        guard level.rawValue >= LogLevel.error.rawValue else { return }
        handlers.forEach { $0.output(string, .error, name) }
    }
    
    public func setLevel(_ level: LogLevel) {
        self.level = level
    }
}

protocol LogHandler {
    func output(_ string: String, _ level: SimpleLog.LogLevel, _ tag: String)
}

class ConsoleLogHandler: LogHandler {
    func output(_ string: String, _ level: SimpleLog.LogLevel, _ tag: String) {
//        let now = DateFormatterFactory.long.string(from: Date())
        NSLog("[%@] %@ %@", tag, level.description, string)
    }
}

class FileLogHandler: LogHandler {
    func output(_ string: String, _ level: SimpleLog.LogLevel, _ tag: String) {
        // MARK: TODO
    }
}

let slog = SimpleLog.default
