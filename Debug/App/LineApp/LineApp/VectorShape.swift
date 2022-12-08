//
//  VectorShape.swift
//  LineApp
//
//  Created by Nail Sharipov on 06.12.2022.
//

import SwiftUI

struct VectorShape: Shape {

    let a: CGPoint
    let b: CGPoint
    let arrow: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path() { path in
            let angle = atan2(b.y - a.y, b.x - a.x)
            let angleLeft = angle + CGFloat.pi * 9 / 10
            let angleRight = angle - CGFloat.pi * 9 / 10
            
            let leftPoint = b + CGPoint(radius: arrow, angle: angleLeft)
            let rightPoint = b + CGPoint(radius: arrow, angle: angleRight)
            
            path.move(to: leftPoint)
            path.addLine(to: b)
            path.addLine(to: rightPoint)
            
            path.move(to: b)
            path.addLine(to: a)
        }
    }
}


func +(left: CGPoint, right: CGPoint) -> CGPoint {
    CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(left: CGFloat, right: CGPoint) -> CGPoint {
    CGPoint(x: left * right.x, y: left * right.y)
}

private extension CGPoint {
    
    init(radius: CGFloat, angle: CGFloat) {
        let x = radius * cos(angle)
        let y = radius * sin(angle)
        self.init(x: x, y: y)
    }
}
