import XCTest
@testable import Swiftzerland

final class SwiftzerlandTests: XCTestCase {
    func testNeutralGreeting() throws {
        let greeting = neutralGreeting()
        XCTAssertFalse(greeting.isEmpty)
    }
    
    func testCreateCourier() throws {
        let courier = createCourier()
        XCTAssertFalse(courier.isEmpty)
    }
}
