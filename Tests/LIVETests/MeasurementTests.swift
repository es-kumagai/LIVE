import XCTest
@testable import LIVE

final class LIVETests: XCTestCase {
    func testMeasure() throws {
        let time = processingTime("TEST") {
            Thread.sleep(forTimeInterval: 1.2)
        }
        XCTAssert(time, in: 1.20 ..< 1.21)
    }
}
