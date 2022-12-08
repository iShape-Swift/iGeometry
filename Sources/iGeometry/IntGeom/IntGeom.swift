//
//  IntGeom.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import CoreGraphics

public struct IntGeom {
    
    public static let defGeom = IntGeom()
    
    public static let maxBits = 31
    public let scale: CGFloat
    public let invertScale: CGFloat
    public let sqrInvertScale: CGFloat
    
    @inlinable
    public init(scale: CGFloat = 10000) {
        self.scale = scale
        self.invertScale = 1 / scale
        self.sqrInvertScale = 1 / scale / scale
    }

    @inlinable
    public func int(float: CGFloat) -> Int64 {
        Int64((float * scale).rounded(.toNearestOrAwayFromZero))
    }
    
    @inlinable
    public func sqrInt(float: CGFloat) -> Int64 {
        Int64((float * scale * scale).rounded(.toNearestOrAwayFromZero))
    }
    
    @inlinable
    public func int(point: CGPoint) -> IntPoint {
        IntPoint(x: Int64((point.x * scale).rounded(.toNearestOrAwayFromZero)), y: Int64((point.y * scale).rounded(.toNearestOrAwayFromZero)))
    }
    
    @inlinable
    public func int(points: [CGPoint]) -> [IntPoint] {
        let n = points.count
        var array = Array<IntPoint>(repeating: .zero, count: n)
        var i = 0
        while i < n {
            let point = points[i]
            array[i] = IntPoint(x: Int64((point.x * scale).rounded(.toNearestOrAwayFromZero)), y: Int64((point.y * scale).rounded(.toNearestOrAwayFromZero)))
            i &+= 1
        }
        return array
    }
    
    @inlinable
    public func int(paths: [[CGPoint]]) -> [[IntPoint]] {
        let n = paths.count
        var array = [[IntPoint]]()
        array.reserveCapacity(n)
        var i = 0
        while i < n {
            array.append(self.int(points: paths[i]))
            i &+= 1
        }
        return array
    }
    
    @inlinable
    public func float(int: Int64) -> CGFloat {
        CGFloat(int) * invertScale
    }
    
    @inlinable
    public func sqrFloat(int: Int64) -> CGFloat {
        CGFloat(int) * sqrInvertScale
    }
    
    @inlinable
    public func float(point: IntPoint) -> CGPoint {
        CGPoint(x: CGFloat(point.x) * invertScale, y: CGFloat(point.y) * invertScale)
    }
    
    @inlinable
    public func float(points: [IntPoint]) -> [CGPoint] {
        let n = points.count
        var array = Array<CGPoint>(repeating: .zero, count: n)
        var i = 0
        while i < n {
            let point = points[i]
            array[i] = CGPoint(x: CGFloat(point.x) * invertScale, y: CGFloat(point.y) * invertScale)
            i &+= 1
        }
        return array
    }
    
    @inlinable
    public func float(paths: [[IntPoint]]) -> [[CGPoint]] {
        let n = paths.count
        var array = [[CGPoint]]()
        array.reserveCapacity(n)
        var i = 0
        while i < n {
            array.append(self.float(points: paths[i]))
            i &+= 1
        }
        return array
    }
}
