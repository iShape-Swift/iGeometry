import XCTest
@testable import iGeometry

final class iGeometryTests: XCTestCase {
    func testSpike_00() throws {
        let target = [
            IntPoint(x:  0, y:  0),
            IntPoint(x:  0, y: 10),
            IntPoint(x: 10, y: 10),
            IntPoint(x: 10, y:  0)
        ]
        var array = target
        array.removeSpikes()
        
        XCTAssertTrue(array.isSame(target))
    }
    
    func testSpike01() throws {
        let target = [
            IntPoint(x:  0, y:  0),
            IntPoint(x:  0, y: 10),
            IntPoint(x:  0, y: 20),
            IntPoint(x: 10, y: 20),
            IntPoint(x: 20, y: 20),
            IntPoint(x: 20, y: 10),
            IntPoint(x: 20, y:  0),
            IntPoint(x: 10, y:  0)
        ]
        var array = target
        array.removeSpikes()
        
        XCTAssertTrue(array.isSame(target))
    }
    
    
    func testSpike_02() throws {
        var array = [
            IntPoint(x:  0, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x: 20, y:  0),
            IntPoint(x: 30, y:  0),
            IntPoint(x: 15, y:  0),
            IntPoint(x: 15, y: 15),
            IntPoint(x:  0, y: 15)
        ]
        
        array.removeSpikes()
        let target = [
            IntPoint(x:  0, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x: 15, y:  0),
            IntPoint(x: 15, y: 15),
            IntPoint(x:  0, y: 15)
        ]
        
        XCTAssertTrue(array.isSame(target))
    }
    
    func testSpike_03() throws {
        var array = [
            IntPoint(x:  0, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x: 20, y:  0),
            IntPoint(x: 30, y:  0),
            IntPoint(x: 15, y:  0),
            IntPoint(x: 15, y: 15),
            IntPoint(x:  0, y: 15),
            IntPoint(x:  5, y:  0)
        ]
        
        array.removeSpikes()
        let target = [
            IntPoint(x:  5, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x: 15, y:  0),
            IntPoint(x: 15, y: 15),
            IntPoint(x:  0, y: 15)
        ]
        
        XCTAssertTrue(array.isSame(target))
    }

    func testSpike_04() throws {
        var array = [
            IntPoint(x:  0, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x: 10, y: 10),
            IntPoint(x: 20, y: 10),
            IntPoint(x: 20, y:  0),
            IntPoint(x: 30, y:  0)
        ]
        
        array.removeSpikes()
        let target = [
            IntPoint(x: 10, y:  0),
            IntPoint(x: 10, y: 10),
            IntPoint(x: 20, y: 10),
            IntPoint(x: 20, y:  0)
        ]
        
        XCTAssertTrue(array.isSame(target))
    }
    
    func testSpike_05() throws {
        var array = [
            IntPoint(x:  0, y:  0),
            IntPoint(x: 20, y:  0),
            IntPoint(x: 20, y: 20),
            IntPoint(x: 20, y: 10),
            IntPoint(x:  0, y: 10),
            IntPoint(x: 10, y: 10),
            IntPoint(x: 10, y:-10),
            IntPoint(x: 10, y:  0)
        ]
        
        array.removeSpikes()
        let target = [
            IntPoint(x: 20, y:  0),
            IntPoint(x: 20, y: 10),
            IntPoint(x: 10, y: 10),
            IntPoint(x: 10, y:  0)
        ]
        
        XCTAssertTrue(array.isSame(target))
    }

    func testSpike_06() throws {
        var array = [
            IntPoint(x:-10, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x:  0, y:  0),
            IntPoint(x:  0, y:-10),
            IntPoint(x:  0, y: 10),
            IntPoint(x:  0, y:  0)
        ]
        
        array.removeSpikes()
        let target = [IntPoint]()
        
        XCTAssertTrue(array.isSame(target))
    }
    
    func testSpike_07() throws {
        var array = [
            IntPoint(x:-10, y:  0),
            IntPoint(x: 10, y:  0),
            IntPoint(x:  0, y:  0),
            IntPoint(x:  0, y:-10),
            IntPoint(x:  0, y: 10)
        ]
        
        array.removeSpikes()
        let target = [
            IntPoint(x:-10, y:  0),
            IntPoint(x:  0, y:  0),
            IntPoint(x:  0, y: 10)
        ]
        
        XCTAssertTrue(array.isSame(target))
    }
}

private extension Array where Element == IntPoint {

    func isSame(_ array: [IntPoint]) -> Bool {
        guard array.count == count else { return false }
        guard !array.isEmpty && self.isEmpty else { return true }
        
        let n = count
        for i in 0..<n {
            var isEqual = true
            for j in 0..<n {
                if self[j] != array[(j + i) % n] {
                    isEqual = false
                    break
                }
            }
            if isEqual {
                return true
            }
        }
        
        return false
    }

}
