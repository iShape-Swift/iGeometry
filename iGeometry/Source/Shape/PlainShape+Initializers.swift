//
//  PlainShape+Initializers.swift
//  iGeometry
//
//  Created by Nail Sharipov on 07.05.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import Foundation

public extension PlainShape {
    
    /// Data to represent complex shape
    /// - Parameters:
    ///   - precision: The minimum required precision. It's a minimum linear distance after which points will be recognized as the same.
    ///   - points: Linear array of all your polygon vertices. All hull's vertices must be list in clockwise order. All holes vertices must be list in counterclockwise order.
    ///   - hull: range of the hull vertices in points array
    ///   - holes: array of ranges for all holes
    init(precision: CGFloat = 0.0001, points: [CGPoint], hull: ArraySlice<CGPoint>?, holes: [ArraySlice<CGPoint>]?) {
        self.init(iGeom: IntGeom(scale: Float(1 / precision)), points: points, hull: hull, holes: holes)
    }

    /// Data to represent complex shape
    /// - Parameters:
    ///   - iGeom: Int <-> Float converter
    ///   - points: Linear array of all your polygon vertices. All hull's vertices must be list in clockwise order. All holes vertices must be list in counterclockwise order.
    ///   - hull: range of the hull vertices in points array
    ///   - holes: array of ranges for all holes
    init(iGeom: IntGeom, points: [CGPoint], hull: ArraySlice<CGPoint>?, holes: [ArraySlice<CGPoint>]?) {
        let intPoints = iGeom.int(points: points.toPoints())

        var layouts = [PlainShape.Layout]()

        if let hull = hull, let holes = holes {
            layouts.reserveCapacity(holes.count + 1)
            layouts.append(PlainShape.Layout(begin: 0, length: hull.endIndex, isClockWise: true))
            for hole in holes {
                let length = hole.endIndex - hole.startIndex
                layouts.append(PlainShape.Layout(begin: hole.startIndex, length: length, isClockWise: false))
            }
        } else {
            layouts.append(PlainShape.Layout(begin: 0, length: intPoints.count, isClockWise: true))
        }
        self.init(points: intPoints, layouts: layouts)
    }
    
}