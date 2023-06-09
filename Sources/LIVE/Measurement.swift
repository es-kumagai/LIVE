//
//  Measurement.swift
//
//
//  Created by Tomohiro Kumagai on 2023/06/09
//
//

import Foundation
import Darwin.C

/// Measuring the processing time of `block` and reporting it to standard output.
/// - Parameters:
///   - label: A label to identificate this measurement. This label will be printed before the measured time.
///   - block: A block for measuring the processing time.
/// - Throws: The error thrown by `block`.
/// - Returns: The measured time.
@inline(__always)
@discardableResult
public func processingTime(_ label: String, _ block: () throws -> Void) rethrows -> timespec {
        
    var start = timespec()
    var end = timespec()
    var time = timespec.zero
    
    timespec_get(&start, TIME_UTC)
    
    do {

        defer {
            
            timespec_get(&end, TIME_UTC)
            time = end - start

            print(label, time)
        }

        try block()
    }
    
    return time
}

