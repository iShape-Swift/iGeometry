//
//  IntPoint.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Foundation

public struct IntPoint: Equatable {
    
    public static let zero = IntPoint(x: 0, y: 0)
    
    public let x: Int64
    public let y: Int64
    
    #if Test
    public let X: Float
    public let Y: Float
    #endif
    
    public var bitPack: Int64 {
        return (x << IntGeom.maxBits) + y
    }
    
    public init(x: Int64, y: Int64) {
        self.x = x
        self.y = y
        #if Test
        self.X = IntGeom.defGeom.float(int: x)
        self.Y = IntGeom.defGeom.float(int: y)
        #endif
    }
    
    public static func == (lhs: IntPoint, rhs: IntPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
