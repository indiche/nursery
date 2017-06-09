import Foundation
import Files

let methodEntryPointRegex = "\\s*func\\s*(\\w*)\\(.*\\)"
let assignmentRegex = "(\\blet\\b|\\bvar\\b)\\s*(\\w+)\\s*\\="
let branchRegex = "(?!.*?func\\s+\\w+)(\\w+)(?=\\s*\\()"
let conditionalRegex = "\\s*(if\\s*.*)"

for file in FileSystem().currentFolder.files {
    guard file.`extension` == "swift" else { continue; }
    guard let contents = try? String(contentsOf: URL(fileURLWithPath: file.path)) else { continue; }

    var assignmentScore = 0
    var branchScore = 0
    var conditionalScore = 0

    contents
        .characters
        .split(separator: "\n")
        .forEach { string in
            let testString = String(string)

            if testString.range(of: assignmentRegex, options: .regularExpression) != nil {
                assignmentScore += 1
            }

            if (testString.range(of: branchRegex, options: .regularExpression) != nil &&
                testString.range(of: methodEntryPointRegex, options: .regularExpression) == nil) {
                branchScore += 1
            }

            if testString.range(of: conditionalRegex, options: .regularExpression) != nil {
                conditionalScore += 1
            }
    }

    let result = sqrt(Double(assignmentScore * assignmentScore) +
        Double(branchScore * branchScore) +
        Double(conditionalScore * conditionalScore))

    print("----------------------------------------------")
    print("Score for \(file.name)")
    print("Assignment: \(assignmentScore)")
    print("Branch: \(branchScore)")
    print("Conditional: \(conditionalScore)")
    print("Result: \(result)")
}
