import Foundation
import Files

class Nursery {

    static func run() {
        FileSystem().currentFolder.makeSubfolderSequence(recursive: true).forEach { folder in
            for file in folder.files {
                guard file.extension == "swift" else { continue; }
                guard let contents = try? String(contentsOf: URL(fileURLWithPath: file.path)) else { continue; }

                var assignmentScore = 0
                var branchScore = 0
                var conditionalScore = 0

                contents
                    .characters
                    .split(separator: "\n")
                    .forEach { line in
                        let line = String(line)
                        assignmentScore += Assignment.score(for: line)
                        branchScore += Branch.score(for: line)
                        conditionalScore += Conditional.score(for: line)
                }

                let score = Score(assignmentScore: assignmentScore, branchScore: branchScore, conditionalScore: conditionalScore)

                let reporter = ConsoleReporter()
                reporter.report(score: score, for: file.path)
            }
        }
    }
}
