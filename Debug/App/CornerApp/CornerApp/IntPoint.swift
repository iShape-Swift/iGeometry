//
//  IntPoint.swift
//  CornerApp
//
//  Created by Nail Sharipov on 30.11.2022.
//

import CoreGraphics

struct IntPoint {
    
    static let zero = IntPoint(x: 0, y: 0)
    static let empty = IntPoint(x: Int64.min, y: Int64.min)
    
    let x: Int64
    let y: Int64

    init(x: Int64, y: Int64) {
        self.x = x
        self.y = y
    }

    init(_ p: CGPoint) {
        self.x = Int64(p.x.rounded(.toNearestOrAwayFromZero))
        self.y = Int64(p.y.rounded(.toNearestOrAwayFromZero))
    }
 
    
    @inlinable
    static func +(left: IntPoint, right: IntPoint) -> IntPoint {
        IntPoint(x: left.x + right.x, y: left.y + right.y)
    }

    @inlinable
    static func -(left: IntPoint, right: IntPoint) -> IntPoint {
        IntPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    @inlinable
    func scalarMultiply(point: IntPoint) -> Int64 { // dot product (cos)
        self.x * point.x + point.y * self.y
    }
    
    @inlinable
    func crossProduct(point: IntPoint) -> Int64 { // cross product
        self.x * point.y - self.y * point.x
    }
}

extension IntPoint: Equatable {
    
    static func == (lhs: IntPoint, rhs: IntPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

#if DEBUG
extension IntPoint: CustomStringConvertible {
    
    var description: String {
        "(\(x), \(y))"
    }
    
}
#endif
