//
//  Rational.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//

import Foundation

struct Rational {

    static func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        
        // GCD(0, b) = b
        if a == 0 { return b }
        
        // GCD(a, 0) = a
        if b == 0 { return a }
        
        // В другом случае, GCD(a, b) = GCD(b, remainder)
        return greatestCommonDivisor(b, a % b)
    }
    
}
