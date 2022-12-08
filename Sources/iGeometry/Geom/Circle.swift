//
//  Circle.swift
//  iGeometry
//
//  Created by Nail Sharipov on 13.02.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import CoreGraphics

public struct Circle {
    
    public let center: CGPoint
    public let radius: CGFloat
    
    @inlinable
    public init(center: CGPoint, radius: CGFloat) {
        self.center = center
        self.radius = radius
    }
}
