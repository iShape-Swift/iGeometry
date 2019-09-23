//
//  PlainShape.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Foundation

public struct PlainShape {
    
    public struct Layout {
        
        let begin: Int
        let end: Int
        let isHole: Bool
        var isEmpty: Bool {
            return begin == -1
        }
        
    }
    
    let points: [IntPoint]
    let layouts: [Layout]
    
    public init(points: [IntPoint], layouts: [Layout]) {
        self.points = points
        self.layouts = layouts
    }
    
    public init(iShape: IntShape) {
        var count = iShape.hull.count
        for hole in iShape.holes {
            count += hole.count
        }
        
        var points = [IntPoint]()
        points.reserveCapacity(count)
        
        var layouts = [Layout]()
        layouts.reserveCapacity(iShape.holes.count + 1)
        
        var start = 0
        var end: Int
        
        end = start + iShape.hull.count - 1
        points.append(contentsOf: iShape.hull)
        
        let layout = Layout(begin: start, end: end, isHole: false)
        layouts.append(layout)
        
        
        start = end + 1
        for hole in iShape.holes {
            end = start + hole.count - 1
            points.append(contentsOf: hole)
            
            let layout = Layout(begin: start, end: end, isHole: true)
            layouts.append(layout)
            
            start = end + 1
        }
        
        self.points = points
        self.layouts = layouts
    }
    
}
