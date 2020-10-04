//
//  Vertex.swift
//  iGeometry
//
//  Created by Nail Sharipov on 23/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

public typealias Index = Int
public let null: Index = -1

public struct Vertex {
    
    public static let empty = Vertex(index: null, isExtra: false, point: .zero)
    
    public let index: Index
    public let isExtra: Bool
    public let point: IntPoint
    
    public init(index: Index, isExtra: Bool, point: IntPoint) {
        self.index = index
        self.point = point
        self.isExtra = isExtra
    }
    
}
