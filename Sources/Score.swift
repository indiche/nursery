import Foundation

struct Score {
    enum Quality {
        case good, mediocre, bad
    }

    let assignmentScore: Int
    let branchScore: Int
    let conditionalScore: Int

    var result: Int {
        return Int(sqrt(Double(assignmentScore * assignmentScore) + Double(branchScore * branchScore) + Double(conditionalScore * conditionalScore)))
    }

    var quality: Quality {
        switch result {
        case 0..<25: return .good
        case 25..<60: return .mediocre
        default: return .bad
        }
    }
}
