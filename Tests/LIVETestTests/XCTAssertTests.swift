//
//  XCTAssertTests.swift
//  
//  
//  Created by Tomohiro Kumagai on 2023/06/09
//  
//

import XCTest
@testable import LIVETest

final class XCTAssertTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAssertValueInRange() throws {
            
            XCTAssert(10, in: 0...100)
            XCTAssert(10, in: 0..<100)
            XCTAssert(10, in: 0...)
            XCTAssert(10, in: ...100)
            XCTAssert(10, in: ..<100)
            XCTAssert(10, in: ..<100)
            XCTAssert(10, in: 0..<100)
            XCTAssert(10, in: 0...100)
            XCTAssert(10, in: 0..<100)
    }
}
