//
//  Corner.swift
//  CornerApp
//
//  Created by Nail Sharipov on 05.12.2022.
//

//import CoreGraphics
//
//struct Corner {
//
//    enum Result {
//        case inCenter
//        case onA
//        case onB
//        case inside
//        case outside
//    }
//    
//    private let o: IntPoint
//    private let ao: IntPoint
//    private let bo: IntPoint
//    
//    private let dir: Int
//
//    @inlinable
//    init(o: IntPoint, a: IntPoint, b: IntPoint) {
//        self.o = o
//        ao = a - o
//        bo = b - o
//
//        dir = ao.crossProduct(point: bo).sign
//    }
//
//    @inlinable
//    init(o: CGPoint, a: CGPoint, b: CGPoint) {
//        self.init(o: IntPoint(o), a: IntPoint(a), b: IntPoint(b))
//    }
//    
//    @inlinable
//    func test(p: CGPoint, clockWise: Bool) -> Result {
//        self.test(p: IntPoint(p), clockWise: clockWise)
//    }
//    
//    @inlinable
//    func test(p: IntPoint, clockWise: Bool) -> Result {
//        let po = p - o
//        
//        let ap = ao.crossProduct(point: po).sign
//        if ap == 0 {
//            if p == o {
//                return .inCenter
//            }
//            
//            let dotProd = po.scalarMultiply(point: ao)
//            if dotProd > 0 {
//                return .onA
//            }
//        }
//
//        let bp = bo.crossProduct(point: po).sign
//        if bp == 0 {
//            let dotProd = po.scalarMultiply(point: bo)
//            if dotProd > 0 {
//                return .onB
//            }
//        }
//        
//        guard dir != 0 else {
//            let d = clockWise ? -1 : 1
//            let isContain = ap == d && bp != d
//            if isContain {
//                return .inside
//            } else {
//                return .outside
//            }
//        }
//        
//        let isSmall = ap == dir && bp != dir
//        let isSmallCW = dir == -1
//        if isSmallCW == clockWise {
//            if isSmall {
//                return .inside
//            } else {
//                return .outside
//            }
//        } else {
//            if !isSmall {
//                return .inside
//            } else {
//                return .outside
//            }
//        }
//    }
//
//}
//
//private extension Int64 {
//    
//    var sign: Int {
//        if self == 0 {
//            return 0
//        } else if self > 0 {
//            return 1
//        } else {
//            return -1
//        }
//    }
//    
//}
