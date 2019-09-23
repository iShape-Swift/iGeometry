//
//  Point.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Foundation

public struct Point: Equatable {
    
    public static let zero = Point(x: 0, y: 0)
    
    public let x: Float
    public let y: Float
    
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
}
