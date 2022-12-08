//
//  ViewModel.swift
//  CornerApp
//
//  Created by Nail Sharipov on 30.11.2022.
//

import SwiftUI
import iGeometry

final class ViewModel: ObservableObject {

    private (set) var color = Color.gray
    private (set) var testPoint = CGPoint.zero
    private (set) var isDrag: Bool = false
    private (set) var size: CGSize = .zero
    private (set) var dots: [CGPoint] = [.zero, .zero, .zero]
    
    private (set) var start = Angle(degrees: 180)
    private (set) var end = Angle(degrees: 0)
    
    var isClockWise: Bool = false {
        didSet {
            self.validate()
            self.objectWillChange.send()
        }
    }
    
    func resize(size: CGSize) {
        guard !isDrag && size != self.size else { return }
        
        self.size = size
        self.testPoint = view(CGPoint(x:    0, y: -100)).round
        dots[0] =        view(CGPoint(x: -100, y: -100)).round
        dots[1] =        view(CGPoint(x:    0, y:    0)).round
        dots[2] =        view(CGPoint(x:  100, y: -100)).round
        
        self.updateAngle()
        self.validate()
    }
    
    func onDrag(index: Int, data: DragGesture.Value) {
        isDrag = true
        dots[index] = data.location.round
//        print(self.world(dots[index]))
        
        self.updateAngle()
        self.validate()
        objectWillChange.send()
    }
    
    func onEndDrag(index: Int, data: DragGesture.Value) {
        dots[index] = data.location.round
//        print(self.world(dots[index]))
        self.updateAngle()
        self.validate()
        objectWillChange.send()
    }

    func onDrag(data: DragGesture.Value) {
        isDrag = true
        testPoint = data.location.round
        
//        print(self.world(testPoint))
        
        self.updateAngle()
        self.validate()
        objectWillChange.send()
    }
    
    func onEndDrag(data: DragGesture.Value) {
        testPoint = data.location.round
        
//        print(self.world(testPoint))
        
        self.updateAngle()
        self.validate()
        objectWillChange.send()
    }
    
    private func validate() {
        let o = self.world(dots[1])
        let a = self.world(dots[0])
        let b = self.world(dots[2])
        
        let tp = self.world(testPoint)
        
        let corner = Corner(o: o, a: a, b: b)
        let result = corner.test(p: tp, clockWise: isClockWise)
        
        switch result {
        case .inside:
            self.color = .green
        case .outside:
            self.color = .black.opacity(0.5)
        case .onA:
            self.color = .blue
        case .onB:
            self.color = .red
        case .inCenter:
            self.color = .white
        }
    }
    
    private func updateAngle() {
        let o = dots[1]
        let a = dots[0]
        let b = dots[2]
        
        let ao = a - o
        let bo = b - o
        
        let a0 = atan2(ao.y, ao.x)
        let a1 = atan2(bo.y, bo.x)

        self.start = Angle(radians: a0)
        self.end = Angle(radians: a1)
    }

    private func world(_ p: CGPoint) -> CGPoint {
        CGPoint(x: p.x - 0.5 * size.width, y: 0.5 * size.height - p.y)
    }

    private func view(_ p: CGPoint) -> CGPoint {
        CGPoint(x: p.x + 0.5 * size.width, y: 0.5 * size.height - p.y)
    }
    
}

extension CGPoint: CustomStringConvertible {

    public var description: String {
        let sx = Double(x).formatted(.number.precision(.fractionLength(1)))
        let sy = Double(y).formatted(.number.precision(.fractionLength(1)))
        
        return "(\(sx), \(sy)"
    }
    
    public var round: CGPoint {
        CGPoint(
            x: (x / 5).rounded(.toNearestOrAwayFromZero) * 5,
            y: (y / 5).rounded(.toNearestOrAwayFromZero) * 5
        )
    }
    
}

