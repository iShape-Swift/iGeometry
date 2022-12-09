//
//  IntPoint+Math.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import CoreGraphics

public extension IntPoint {
    
    @inlinable
    static func +(left: IntPoint, right: IntPoint) -> IntPoint {
        IntPoint(x: left.x + right.x, y: left.y + right.y)
    }

    @inlinable
    static func -(left: IntPoint, right: IntPoint) -> IntPoint {
        IntPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    @inlinable
    func dotProduct(_ point: IntPoint) -> Int64 { // dot product (cos)
        self.x * point.x + point.y * self.y
    }
    
    @inlinable
    func crossProduct(_ point: IntPoint) -> Int64 { // cross product
        self.x * point.y - self.y * point.x
    }
    
    @inlinable
    func normal(iGeom: IntGeom) -> IntPoint {
        let p = iGeom.float(point: self)
        let l = (p.x * p.x + p.y * p.y).squareRoot()
        let k = 1 / l
        let x = k * p.x
        let y = k * p.y
        
        return iGeom.int(point: CGPoint(x: x, y: y))
    }
    
    @inlinable
    func sqrDistance(_ point: IntPoint) -> Int64 {
        let dx = point.x - self.x
        let dy = point.y - self.y

        return dx * dx + dy * dy
    }

}
