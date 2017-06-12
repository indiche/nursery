let CSI = "\u{001B}["

class Color {

    static func from(quality: Score.Quality) -> String {
        switch quality {
        case .good: return "\(CSI)32m"
        case .mediocre: return "\(CSI)33m"
        case .bad: return "\(CSI)31m"
        }
    }
}

class ConsoleReporter {

    func report(score: Score, for filename: String) {
//        print(Color.from(quality: score.quality), terminator: "")
        print("\(score.result)\t\(filename)")
//        print("\(CS   I)0m")
    }
}
