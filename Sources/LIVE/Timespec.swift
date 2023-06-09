//
//  Timespec.swift
//  
//  
//  Created by Tomohiro Kumagai on 2023/06/09
//  
//

import Foundation

extension timespec {
    
    /// The time value less than 1 second in microseconds.
    public var tv_μsec: Int {
        tv_nsec / 1000
    }
    
    /// The time value less than 1 second in milliseconds.
    public var tv_msec: Int {
        tv_μsec / 1000
    }
}

extension timespec : ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntegerLiteralType) {
        
        self.init(tv_sec: value, tv_nsec: 0)
    }
}

extension timespec : ExpressibleByFloatLiteral {
    
    public init(floatLiteral value: FloatLiteralType) {
        
        self.init(tv_sec: Int(value), tv_nsec: Int(value * 1_000_000_000) % 1_000_000_000)
    }
}

extension timespec : AdditiveArithmetic {
    
    public static var zero: timespec = {
        
        var timespec = timespec()
        
        timespec.tv_sec = 0
        timespec.tv_nsec = 0
        
        return timespec
    }()
    
    @inline(__always)
    public static func + (lhs: timespec, rhs: timespec) -> timespec {
        
        var lhs = lhs
        lhs += rhs
        
        return lhs
    }
    
    @inline(__always)
    public static func - (lhs: timespec, rhs: timespec) -> timespec {
        
        var lhs = lhs
        lhs -= rhs
        
        return lhs
    }
    
    @inline(__always)
    public static func += (lhs: inout timespec, rhs: timespec) {
        
        lhs.tv_sec += rhs.tv_sec
        lhs.tv_nsec += rhs.tv_nsec
        
        if lhs.tv_nsec >= 1_000_000_000 {
            
            lhs.tv_sec += 1
            lhs.tv_nsec -= 1_000_000_000
        }
    }
    
    @inline(__always)
    public static func -= (lhs: inout timespec, rhs: timespec) {
        
        lhs.tv_sec -= rhs.tv_sec
        lhs.tv_nsec -= rhs.tv_nsec
        
        if lhs.tv_nsec < 0 {
            
            lhs.tv_sec -= 1
            lhs.tv_nsec += 1_000_000_000
        }
    }
}

extension timespec : Comparable {

    @inline(__always)
    public static func == (lhs: timespec, rhs: timespec) -> Bool {

        lhs.tv_sec == rhs.tv_sec && lhs.tv_nsec == rhs.tv_nsec
    }

    @inline(__always)
    public static func < (lhs: timespec, rhs: timespec) -> Bool {
        
        if lhs.tv_sec < rhs.tv_sec {
            
            return true
        }
        else if lhs.tv_sec == rhs.tv_sec {
            
            return lhs.tv_nsec < rhs.tv_nsec
        }
        else {
            
            return false
        }
    }
}

extension timespec : CustomStringConvertible {

    private static let secFormatter: NumberFormatter = {
    
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        
        return formatter
    }()

    private static let nsecFormatter: NumberFormatter = {
    
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .none
        formatter.maximumIntegerDigits = 6
        formatter.maximumFractionDigits = 0
        formatter.decimalSeparator = ""
        formatter.formatWidth = 6
        formatter.paddingPosition = .afterPrefix
        formatter.paddingCharacter = "0"
        
        return formatter
    }()
    
    public var description: String {
        "\(tv_sec).\(Self.nsecFormatter.string(from: NSNumber(value: tv_μsec))!)"
    }
}
