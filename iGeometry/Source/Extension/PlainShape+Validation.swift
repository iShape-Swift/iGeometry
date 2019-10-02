//
//  IntShape+Validation.swift
//  iGeometry
//
//  Created by Nail Sharipov on 02/10/2019.
//

import Foundation

public extension PlainShape {
    
    enum ValidationResult {
        case valid
        case hullIsNotValid
        case holeIsNotValid(Int)
    }
    
    func validate() -> ValidationResult {
        var i = 0
        for layout in layouts {
            let isCCW = self.isClockWise(begin: layout.begin, end: layout.end)
            if layout.isHole {
                if isCCW {
                    return .holeIsNotValid(i - 1)
                }
            } else {
                if !isCCW {
                    return .hullIsNotValid
                }
            }
            i += 1
        }
    
        return .valid
    }

    private func isClockWise(begin: Int, end: Int) -> Bool {
        var sum: Int64 = 0
        var p1 = self.points[end]
        for i in begin...end {
            let p2 = self.points[i]
            let difX = p2.x - p1.x
            let sumY = p2.y + p1.y
            sum += difX * sumY
            p1 = p2
        }
        
        return sum >= 0
    }
    
}
