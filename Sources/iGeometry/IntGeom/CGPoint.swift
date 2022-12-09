//
//  CGPoint.swift
//  
//
//  Created by Nail Sharipov on 09.12.2022.
//

import CoreGraphics

public extension CGPoint {

    @inlinable
    var sqrMagnitude: CGFloat {
        x * x + y * y
    }
    
    @inlinable
    var normalized: CGPoint {
        let k = 1 / sqrMagnitude.squareRoot()
        return CGPoint(x: k * x, y: k * y)
    }
    
    @inlinable
    init(point: IntPoint) {
        self.init(x: CGFloat(point.x), y: CGFloat(point.y))
    }
    
    @inlinable
    init(radius: CGFloat, angle: CGFloat) {
        let x = radius * cos(angle)
        let y = radius * sin(angle)
        self.init(x: x, y: y)
    }
    
    @inlinable
    func sqrDistance(point: CGPoint) -> CGFloat {
        let dx = point.x - self.x
        let dy = point.y - self.y

        return dx * dx + dy * dy
    }
    
    @inlinable
    var normal: CGPoint {
        let l = (x * x + y * y).squareRoot()
        let k = 1 / l
        let x = k * x
        let y = k * y
        
        return CGPoint(x: x, y: y)
    }
    
    @inlinable
    func dotProduct(_ vector: CGPoint) -> CGFloat { // cos
        self.x * vector.x + vector.y * self.y
    }
    
    @inlinable
    func crossProduct(_ vector: CGPoint) -> CGFloat {
        self.x * vector.y - self.y * vector.x
    }

}

@inlinable
public func +(left: CGPoint, right: CGPoint) -> CGPoint {
    CGPoint(x: left.x + right.x, y: left.y + right.y)
}

@inlinable
public func -(left: CGPoint, right: CGPoint) -> CGPoint {
    CGPoint(x: left.x - right.x, y: left.y - right.y)
}

@inlinable
public func *(left: CGFloat, right: CGPoint) -> CGPoint {
    CGPoint(x: left * right.x, y: left * right.y)
}

@inlinable
public func *(left: CGFloat, right: CGSize) -> CGSize {
    CGSize(width: left * right.width, height: left * right.height)
}
