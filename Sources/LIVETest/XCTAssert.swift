//
//  XCTAssert.swift
//
//
//  Created by Tomohiro Kumagai on 2023/06/09
//
//

#if canImport(XCTest)

import Foundation
import XCTest

/// Asserts that `value` is within `range`.
/// - Parameters:
///   - value: A value to check whether the value in `range`.
///   - range: A range of values to check.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssert<Value>(_ value: Value, in range: some RangeExpression<Value>, file: StaticString = #file, line: UInt = #line) {
    
    if !range.contains(value) {
        XCTFail("`\(value)` is not within `\(range)`.", file: file, line: line)
    }
}

#endif
