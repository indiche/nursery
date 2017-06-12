import XCTest
@testable import nursery

class ConditionalTests: XCTestCase {

    func testItMatchesIf() {
        let result = Conditional.score(for: "if 2 == 2 {")

        XCTAssertEqual(1, result)
    }

    func testItMatchesIfLet() {
        let result = Conditional.score(for: "if let a = optional {")

        XCTAssertEqual(1, result)
    }

    func testItMatchesElse() {
        let result = Conditional.score(for: "} else {")

        XCTAssertEqual(1, result)
    }

    func testItMatchesIfAndElseOnTheSameLine() {
        let result = Conditional.score(for: "if test { return 1 } else { return 0 }")

        XCTAssertEqual(2, result)
    }

    func testItMatchesCase() {
        let result = Conditional.score(for: "case 3: return 5")

        XCTAssertEqual(1, result)
    }

    func testItMatchesDefault() {
        let result = Conditional.score(for: "default:")

        XCTAssertEqual(1, result)
    }

    func testItScoresOneForIfCase() {
        let result = Conditional.score(for: "if case 0..<255 = number {")

        XCTAssertEqual(1, result)
    }

    static var allTests = [
        ("testItMatchesIf", testItMatchesIf),
        ("testItMatchesIfLet", testItMatchesIfLet),
        ("testItMatchesElse", testItMatchesElse),
        ("testItMatchesIfAndElseOnTheSameLine", testItMatchesIfAndElseOnTheSameLine),
        ("testItMatchesCase", testItMatchesCase),
        ("testItMatchesDefault", testItMatchesDefault),
        ("testItScoresOneForIfCase", testItScoresOneForIfCase)
    ]
}
