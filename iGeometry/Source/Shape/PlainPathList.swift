//
//  PlainPathList.swift
//  iGeometry
//
//  Created by Nail Sharipov on 02.11.2019.
//

import Foundation

public struct PlainPathList {
    
    public struct Layout {
        
        public let begin: Int
        public let end: Int
        public let isClockWise: Bool
        
        public init(begin: Int, end: Int, isClockWise: Bool) {
            self.begin = begin
            self.end = end
            self.isClockWise = isClockWise
        }
    }
    
    public var pathes: [[IntPoint]] {
        let n = layouts.count
        var pathes = Array<[IntPoint]>()
        pathes.reserveCapacity(n)
        for i in 0..<n {
            let layout = self.layouts[i]
            let slice = self.points[layout.begin..<layout.end]
            pathes.append(Array(slice))
        }
        return pathes
    }
    
    public func getPath(layout: Layout) -> [IntPoint] {
        let slice = self.points[layout.begin..<layout.end]
        return Array(slice)
    }
    
    public private (set) var points: [IntPoint]
    public private (set) var layouts: [Layout]
    
    public init() {
        self.points = [IntPoint]()
        self.layouts = [Layout]()
    }
    
    public init(points: [IntPoint], layouts: [Layout]) {
        self.points = points
        self.layouts = layouts
    }
    
    public mutating func append(path: [IntPoint], isClockWise: Bool) {
        let begin = points.count
        let end = begin + path.count
        let layout = Layout(
            begin: begin,
            end: end,
            isClockWise: isClockWise
        )
        points.append(contentsOf: path)
        layouts.append(layout)
    }
    
}
