//
//  DBPoint.swift
//  iGeometry
//
//  Created by Nail Sharipov on 09.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

public struct DBPoint {
    
    public static let zero = DBPoint(x: 0, y: 0)
    
    public let x: Double
    public let y: Double

    @inlinable
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    @inlinable
    public init(iPoint: IntPoint) {
        self.x = Double(iPoint.x)
        self.y = Double(iPoint.y)
    }
    
    @inlinable
    public func sqrDistance(point: DBPoint) -> Double {
        let dx = point.x - self.x
        let dy = point.y - self.y

        return dx * dx + dy * dy
    }
    
    @inlinable
    public var normal: DBPoint {
        let l = (x * x + y * y).squareRoot()
        let k = 1 / l
        let x = k * x
        let y = k * y
        
        return DBPoint(x: x, y: y)
    }
    
    @inlinable
    public func dotProduct(_ vector: DBPoint) -> Double { // cos
        self.x * vector.x + vector.y * self.y
    }
    
    @inlinable
    public func crossProduct(_ vector: DBPoint) -> Double {
        self.x * vector.y - self.y * vector.x
    }

    @inlinable
    static func +(left: DBPoint, right: DBPoint) -> DBPoint {
        DBPoint(x: left.x + right.x, y: left.y + right.y)
    }

    @inlinable
    static func -(left: DBPoint, right: DBPoint) -> DBPoint {
        DBPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    @inlinable
    public static func == (lhs: DBPoint, rhs: DBPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}
