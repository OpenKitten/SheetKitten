import XCTest
@testable import SheetKitten

class SheetKittenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SheetKitten().text, "Hello, World!")
    }


    static var allTests : [(String, (SheetKittenTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
