//
//  File.swift
//  
//
//  Created by Nail Sharipov on 09.12.2022.
//

public extension Array where Element == IntPoint {
    
    mutating func removeSpikes() {
        var n = 0
        repeat {
            n = self.count
            self.clean()
        } while n != count
    }
    
    private mutating func clean() {
        let n = self.count
        guard n > 2 else {
            self.removeAll()
            return
        }
        
        var next = self.findNextStart(start: 0)

        guard next >= 0 else { return }
        
        var result = [IntPoint]()
        result.reserveCapacity(n)
        
        let firstStart = self.findBackStart(start: next)
        var start = firstStart
        repeat {
            let length = self.findLength(start: start)
            result.addNextSegment(start: start, length: length, source: self)
            
            next = (start + length) % n

            start = self.findNextStart(start: next)
            
            result.add(a: next, b: start, source: self)
            
        } while start != firstStart
        
        self = result
    }
    
    private struct OrderPoint {
        let order: Int64
        let point: IntPoint
    }
    
    private mutating func addNextSegment(start: Int, length: Int, source: [IntPoint]) {
        let n = source.count
        var buffer = [OrderPoint]()
        buffer.reserveCapacity(length)
        
        let a = source[start]
        let b = source[(start + length) % n]
        
        let ab = (a - b).sqrMagnitude
        
        var i = 0
        while i < length {
            let c = source[(start + i) % n]
            let ac = (a - c).sqrMagnitude
            let bc = (b - c).sqrMagnitude
            
            if ac < ab && bc < ab {
                buffer.append(.init(order: ac, point: c))
            }

            i = (i + 1) % n
        }
        
        guard !buffer.isEmpty else { return }
        
        if buffer.count > 1 {
            buffer.sort(by: { $0.order < $1.order })
        }
        
        for p in buffer {
            self.append(p.point)
        }
    }
    
    private mutating func add(a: Int, b: Int, source: [IntPoint]) {
        let n = source.count
        var i = a
        while i != b {
            self.append(source[i])
            i = (i + 1) % n
        }
        self.append(source[b])
    }

    private func findBackStart(start: Int) -> Int {
        let n = self.count
        
        var i = (start + 1) % n
        var c = self[i]
        
        i = (i - 1 + n) % n
        var b = self[i]

        for _ in 0..<n {
            i = (i - 1 + n) % n
            let a = self[i]
            
            let ab = b - a
            let ac = c - a
            
            let isSameLine = ab.x * ac.y - ac.x * ab.y == 0

            if !isSameLine {
                return (i + 1) % n
            }
            c = b
            b = a
        }
        
        return -1
    }
    
    private func findNextStart(start: Int) -> Int {
        let n = self.count
        
        var i = start
        var a = self[i]
        
        i = (i + 1) % n
        var b = self[i]
        
        for _ in 0..<n {
            i = (i + 1) % n
            let c = self[i]
            let ab = b - a
            let ac = c - a
            let isSameLine = ab.x * ac.y - ac.x * ab.y == 0
            
            if isSameLine {
                return (i - 2 + n) % n
            }
            
            a = b
            b = c
        }
        
        
        return -1
    }
    
    private func findLength(start: Int) -> Int {
        let n = self.count
        
        var i = (start + 1) % n
        var a = self[i]
        
        i = (i + 1) % n
        var b = self[i]

        var length = 2
        
        for _ in 0..<n {
            i = (i + 1) % n
            let c = self[i]
            let ab = b - a
            let ac = c - a
            let isSameLine = ab.x * ac.y - ac.x * ab.y == 0

            if isSameLine {
                length += 1
            } else {
                break
            }
            
            a = b
            b = c
        }
        
        return length
    }
    
}
