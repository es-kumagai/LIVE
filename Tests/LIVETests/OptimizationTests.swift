//
//  OptimizationTests.swift
//  
//  
//  Created by Tomohiro Kumagai on 2023/06/09
//  
//

import XCTest
@testable import LIVE

final class OptimizationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOptimizedValue() throws {

        let value = adoptValue(forOptimized: 10, forUnoptimized: 100)
        
        XCTAssertEqual(value, 100)
    }
}
