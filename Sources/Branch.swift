import Foundation

class Branch {
    static let functionDeclaration = "\\s*func\\s*(\\w*)\\(.*\\)"
    static let branchRegex = "(?!.*?func\\s+\\w+)(\\w+)(?=\\s*\\()"

    static func score(for line: String) -> Int {
        if (line.range(of: branchRegex, options: .regularExpression) != nil && line.range(of: functionDeclaration, options: .regularExpression) == nil) {
            return 1
        } else {
            return 0
        }
    }
}
