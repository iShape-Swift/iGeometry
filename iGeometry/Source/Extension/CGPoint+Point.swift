//
//  CGPoint+Point.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Foundation

public extension Array where Element == CGPoint {
    
    func toPoints() -> [Point]  {
        let n = self.count
        var array = [Point].init(repeating: .zero, count: n)
        var i = 0
        while i < n {
            array[i] = self[i].point
            i &+= 1
        }
        return array
    }
    
}

public extension Array where Element == [CGPoint] {
    
    func toPaths() -> [[Point]]  {
        let n = self.count
        var array = [[Point]]()
        array.reserveCapacity(n)
        var i = 0
        while i < n {
            array.append(self[i].toPoints())
            i &+= 1
        }
        return array
    }
    
}

public extension CGPoint {
    var point: Point {
        return Point(x: Float(self.x), y: Float(self.y))
    }
}
