//
//  CodebaseTests.swift
//  CodebaseTests
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import XCTest
@testable import Codebase

class CodebaseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSubstring() {
        let raw = "Hello world"
        XCTAssertEqual("He", raw.substring(in: 0..<2))
        
        let length = raw.count
        XCTAssertEqual("ld", raw.substring(in: length-2..<length))
        
        XCTAssertNotEqual("he", raw.substring(in: 0..<2))
        
        XCTAssertEqual("", raw.substring(in: 0..<0))
        
        XCTAssert(raw.valid(range: 4..<length))
        XCTAssertFalse(raw.valid(range: 4..<length + 1))
    }
    
    func testRegex() {
        let raw = "Unlike the Ruby community, the Objective-C and Swift world have very much lacked the abundance of resources and tutorials in teaching TDD or even just tests in general. Hell even a brand-spanking-new project created by Xcode doesn’t come with a practical, real world test in it."
        
        let pattern1 = """
            ^Unlike.+C
            """
        let result1 = try! Regex.match(pattern: pattern1, in: raw)
        XCTAssertEqual("Unlike the Ruby community, the Objective-C", result1)
    }

}
