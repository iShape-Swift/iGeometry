//
//  IntPoint+Array.swift
//  iGeometry
//
//  Created by Nail Sharipov on 01.01.2020.
//

import Foundation

public extension Array where Element == IntPoint {
    
    mutating func invert() {
        let n = self.count
        let m = n >> 1
        for i in 0..<m {
            let j = n - i - 1
            let a = self[i]
            let b = self[j]
            self[i] = b
            self[j] = a
        }
    }

}
