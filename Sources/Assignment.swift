import Foundation

class Assignment {
    static let regex = "(\\blet\\b|\\bvar\\b)\\s*(\\w+)\\s*\\="

    static func score(for line: String) -> Int {
        if line.range(of: regex, options: .regularExpression) != nil {
            return 1
        } else {
            return 0
        }
    }
}
