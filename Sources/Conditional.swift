import Foundation

class Conditional {
    static let ifRegex = "\\s*(if\\s*.*)\\{"
    static let elseRegex = "\\}\\s*else\\s*\\{"
    static let caseRegex = "\\s*(case .+:)"
    static let defaultRegex = "\\s*(default:)"

    static func score(for line: String) -> Int {
        var result = 0

        if line.range(of: ifRegex, options: .regularExpression) != nil {
            result += 1
        }

        if line.range(of: elseRegex, options: .regularExpression) != nil {
            result += 1
        }

        if line.range(of: caseRegex, options: .regularExpression) != nil {
            result += 1
        }

        if line.range(of: defaultRegex, options: .regularExpression) != nil {
            result += 1
        }

        return result
    }
}
