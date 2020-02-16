//
//  Triangle.swift
//  iGeometry
//
//  Created by Nail Sharipov on 13.02.2020.
//

import Foundation

public struct Triangle {
    
    public let a: Point
    public let b: Point
    public let c: Point
    
    public init(a: Point, b: Point, c: Point) {
        self.a = a
        self.b = b
        self.c = c
    }
 
    public var area: Float {
        return 0.5 * (a.x * (c.y - b.y) + b.x * (a.y - c.y) + c.x * (b.y - a.y))
    }
    
    public var circumscribedСircle: Circle {
        return Triangle.circumscribedСircle(a: a, b: b, c: c)
    }
    
    public var inscribedСircle: Circle {
        return Triangle.inscribedСircle(a: a, b: b, c: c)
    }
    
    public static func circumscribedСircle(a: Point, b: Point, c: Point) -> Circle {
        let d = 2 * (a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y))
        let x = ((a.x * a.x + a.y * a.y) * (b.y - c.y) + (b.x * b.x + b.y * b.y) * (c.y - a.y) + (c.x * c.x + c.y * c.y) * (a.y - b.y)) / d
        let y = ((a.x * a.x + a.y * a.y) * (c.x - b.x) + (b.x * b.x + b.y * b.y) * (a.x - c.x) + (c.x * c.x + c.y * c.y) * (b.x - a.x)) / d
        
        let r = sqrt((a.x - x) * (a.x - x) + (a.y - y) * (a.y - y))
        
        return Circle(center: Point(x: x, y: y), radius: r)
    }
    
    public static func inscribedСircle(a: Point, b: Point, c: Point) -> Circle {
        let ABx = a.x - b.x
        let ABy = a.y - b.y
        let AB = sqrt(ABx * ABx + ABy * ABy)
        
        let ACx = a.x - c.x
        let ACy = a.y - c.y
        let AC = sqrt(ACx * ACx + ACy * ACy)
        
        let BCx = b.x - c.x
        let BCy = b.y - c.y
        let BC = sqrt(BCx * BCx + BCy * BCy)
        
        let p = AB + BC + AC
        
        let Ox = (BC * a.x + AC * b.x + AB * c.x) / p
        let Oy = (BC * a.y + AC * b.y + AB * c.y) / p
        
        let r = sqrt((-BC + AC + AB) * (BC - AC + AB) * (BC + AC - AB) / (4 * p))
        return Circle(center: Point(x: Ox, y: Oy), radius: r)
    }
}