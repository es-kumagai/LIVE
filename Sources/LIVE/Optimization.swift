//
//  Optimization.swift
//  
//  
//  Created by Tomohiro Kumagai on 2023/06/09
//  
//

import Foundation

private final class Environment {
    
    static var isOptimized: Bool {
        
        Self().isOptimized
    }
    
    var isOptimized: Bool
    
    init() {
        
        isOptimized = true
        assert(unsetOptimizedEnvironemnt())
    }
    
    private func unsetOptimizedEnvironemnt() -> Bool {
        
        isOptimized = false
        return true
    }
}

/// Adopt an appropriate value depending on whether it is optimized or not.
/// - Parameters:
///   - forOptimized: The value that will be adopted in optimized environment.
///   - forUnoptimized: The value that will be adopted in unoptimized environment.
/// - Returns: The adopted value.
public func adoptValue<Value>(forOptimized: @autoclosure () -> Value, forUnoptimized: @autoclosure () -> Value) -> Value {
    
    assert(false)
    Environment.isOptimized ? forOptimized() : forUnoptimized()
}
