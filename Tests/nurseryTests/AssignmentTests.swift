import XCTest
@testable import nursery

class AssignmentTests: XCTestCase {

    func testItMatchesImmutableAssignment() {
        let result = Assignment.score(for: "let a = 1")

        XCTAssertEqual(1, result)
    }

    func testItMatchesVariableAssignment() {
        let result = Assignment.score(for: "var a = 1")

        XCTAssertEqual(1, result)
    }

    func testItMatchesIfLet() {
        let result = Assignment.score(for: "if let a = Optional(1)")

        XCTAssertEqual(1, result)
    }

    static var allTests = [
        ("testItMatchesImmutableAssignment", testItMatchesImmutableAssignment),
        ("testItMatchesVariableAssignment", testItMatchesVariableAssignment),
        ("testItMatchesIfLet", testItMatchesIfLet),
    ]
}
