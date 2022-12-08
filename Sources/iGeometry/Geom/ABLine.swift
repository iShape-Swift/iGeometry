//
//  ABLine.swift
//  
//
//  Created by Nail Sharipov on 08.12.2022.
//

import CoreGraphics

public struct ABLine {
    
    public let a: IntPoint
    public let b: IntPoint

    @inlinable
    public init(a: IntPoint, b: IntPoint) {
        self.a = a
        self.b = b
    }
    
    @inlinable
    public func normalBase(point p: IntPoint) -> CGPoint {
        if a.x == b.x {
            return CGPoint(x: CGFloat(a.x), y: CGFloat(p.y))
        } else if a.y == b.y {
            return CGPoint(x: CGFloat(p.x), y: CGFloat(a.y))
        } else {
            let px = Double(p.x)
            let py = Double(p.y)
            
            let ax = Double(a.x)
            let ay = Double(a.y)
            
            let bx = Double(b.x)
            let by = Double(b.y)
            
            let dx = bx - ax
            let sx = dx * dx
            let dy = by - ay
            let sy = dy * dy
            
            
            let x = (ax * sy + px * sx + dx * dy * (py - ay)) / (sy + sx)
            let y = dx * (px - x) / dy + py
            
            return CGPoint(x: x, y: y)
        }
    }
    
    @inlinable
    public func isSameLine(point c: IntPoint) -> Bool {
        let ba = b - a
        let ca = c - a
        return ba.x * ca.y - ca.x * ba.y == 0
    }
}
