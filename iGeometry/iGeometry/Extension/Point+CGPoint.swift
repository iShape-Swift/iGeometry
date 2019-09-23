//
//  Point+CGPoint.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Foundation

public extension Array where Element == Point {
    
    func toCGPoints() -> [CGPoint]  {
        let n = self.count
        var array = [CGPoint].init(repeating: .zero, count: n)
        var i = 0
        while i < n {
            array[i] = self[i].toCGPoint
            i &+= 1
        }
        return array
    }
    
}

public extension Array where Element == [Point] {
    
    func toCGPoints() -> [[CGPoint]]  {
        let n = self.count
        var array = [[CGPoint]]()
        array.reserveCapacity(n)
        var i = 0
        while i < n {
            array.append(self[i].toCGPoints())
            i &+= 1
        }
        return array
    }
    
}

public extension Point {
    
    var toCGPoint: CGPoint {
        return CGPoint(x: CGFloat(self.x), y: CGFloat(self.y))
    }
}
