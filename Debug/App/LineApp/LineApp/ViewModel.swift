//
//  ViewModel.swift
//  LineApp
//
//  Created by Nail Sharipov on 06.12.2022.
//

import SwiftUI
import iGeometry

final class ViewModel: ObservableObject {

    private (set) var p = CGPoint.zero
    private (set) var a: CGPoint = .zero
    private (set) var b: CGPoint = .zero
    private (set) var isSameLine: Bool = false
    private (set) var color: Color = .green
    private (set) var o: CGPoint?
    private (set) var isDrag: Bool = false
    private (set) var size: CGSize = .zero
    
    func resize(size: CGSize) {
        guard !isDrag && size != self.size else { return }
        
        self.size = size
        self.p = view(CGPoint(x:    0, y: -100)).round
        self.a = view(CGPoint(x: -100, y:    0)).round
        self.b = view(CGPoint(x:  100, y:    0)).round

        self.updateVector()
    }

    func onDragP(data: DragGesture.Value) {
        isDrag = true
        p = data.location.round
        
        print(self.world(p))
        
        self.updateVector()
        objectWillChange.send()
    }
    
    func onEndDragP(data: DragGesture.Value) {
        p = data.location.round
        
        print(self.world(p))
        
        self.updateVector()
        objectWillChange.send()
    }
    
    func onDragA(data: DragGesture.Value) {
        isDrag = true
        a = data.location.round
        
        print(self.world(a))

        self.updateVector()
        objectWillChange.send()
    }
    
    func onEndDragA(data: DragGesture.Value) {
        a = data.location.round
        
        print(self.world(a))

        self.updateVector()
        objectWillChange.send()
    }
    
    func onDragB(data: DragGesture.Value) {
        isDrag = true
        b = data.location.round
        
        print(self.world(b))

        self.updateVector()
        objectWillChange.send()
    }
    
    func onEndDragB(data: DragGesture.Value) {
        b = data.location.round
        
        print(self.world(b))

        self.updateVector()
        objectWillChange.send()
    }
    
    private func updateVector() {
        let wa = self.world(a)
        let wb = self.world(b)
        let wp = self.world(p)

        let ia = IntPoint(x: Int64(wa.x), y: Int64(wa.y))
        let ib = IntPoint(x: Int64(wb.x), y: Int64(wb.y))
        let ip = IntPoint(x: Int64(wp.x), y: Int64(wp.y))

        let line = ABLine(a: ia, b: ib)
        
        let wo = line.normalBase(point: ip)
        
        self.isSameLine = line.isSameLine(point: ip)
        if self.isSameLine {
            color = .red
        } else {
            color = .green
        }
        
        o = self.view(wo)
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
