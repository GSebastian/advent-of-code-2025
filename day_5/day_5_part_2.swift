import Foundation

extension Day_5_Part_2 {
    
    static func solution(_ source: Input) throws -> Int {
        let input = try Self.parseInput(source)
        var intervals = input.0.sorted { $0.0 < $1.0 }

        // Merge intervals
        intervals = {
            var merged: [(Int, Int)] = [intervals[0]]
            var i = 1
            while i < intervals.count {
                if intervals[i].0 <= merged[merged.count - 1].1 {
                    merged[merged.count - 1].1 = max(intervals[i].1, merged[merged.count - 1].1)
                } else {
                    merged.append(intervals[i])
                }
                i += 1
            }
            return merged
        }()

        var result = 0

        for (lhs, rhs) in intervals {
            result += rhs - lhs + 1
        }

        return result
    }
}

/// Input parsing
enum Day_5_Part_2 {

    enum Input {
        case simple
        case main
        case custom
    }

    static func parseInput(_ source: Input) throws -> (intervals: [(Int, Int)], numbers: [Int]) {
        let fileName = {
            let base = "day_5_input"
            let typeSuffix = switch source {
                case .simple: "_simple"
                case .main: ""
                case .custom: "_custom"
            }
            return base + typeSuffix + ".txt"
        }()

        let contents = try String(contentsOfFile: fileName, encoding: .utf8)
        let lines = contents.split(separator: "\n")

        var intervals: [(Int, Int)] = []
        var numbers: [Int] = []

        var li = 0
        while li < lines.count {
            let split = lines[li].split(separator: "-")
            if split.count == 2 {
                intervals.append((Int(split[0])!, Int(split[1])!))
            } else {
                numbers.append(Int(lines[li])!)
            }
            li += 1
        }
        return (intervals: intervals, numbers: numbers)
    }
}

let result = try Day_5_Part_2.solution(.main)
print(result)