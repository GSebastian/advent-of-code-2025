import Foundation

extension Day_4 {
    
    static func solution(_ source: Input) throws -> Int {
        let input = try Self.parseInput(source)
        var counts = input.map { $0.map { _ in 0 } }

        var result = 0

        for (i, line) in input.enumerated() {
            for (j, _) in line.enumerated() {
                guard line[j] == "@" else { continue }

                let affected = Self.affectedIndices(for: (i, j), rows: input.count, cols: input[0].count)
                for (ai, aj) in affected {
                    if input[ai][aj] == "@" {
                        counts[i][j] += 1
                    }
                }
            }
        }

        for (i, line) in input.enumerated() {
            for (j, _) in line.enumerated() {
                if line[j] == "@" && counts[i][j] < 4 {
                    result += 1
                }
            }
        }

        return result
    }

    private static func affectedIndices(for index: (Int, Int), rows: Int, cols: Int) -> [(Int, Int)] {
        let (row, col) = (index.0, index.1)
        var result: [(Int, Int)] = []
        
        // above
        if row > 0 {
            result.append((row - 1, col))
        }

        // below
        if row < rows - 1 {
            result.append((row + 1, col))
        }
        // left
        if col > 0 {
            result.append((row, col - 1))
        }

        // right
        if col < cols - 1 {
            result.append((row, col + 1))
        }

        // top-left
        if row > 0 && col > 0 {
            result.append((row - 1, col - 1))
        }

        // top-right
        if row > 0 && col < cols - 1 {
            result.append((row - 1, col + 1))
        }

        // bottom-left
        if row < rows - 1 && col > 0 {
            result.append((row + 1, col - 1))
        }

        // bottom-right
        if row < rows - 1 && col < cols - 1 {
            result.append((row + 1, col + 1))
        }

        return result
    }
}

/// Input parsing
enum Day_4 {

    enum Input {
        case simple
        case main
        case custom
    }

    static func parseInput(_ source: Input) throws -> [[String]] {
        let fileName = {
            let base = "day_4_input"
            let typeSuffix = switch source {
                case .simple: "_simple"
                case .main: ""
                case .custom: "_custom"
            }
            return base + typeSuffix + ".txt"
        }()

        let contents = try String(contentsOfFile: fileName, encoding: .utf8)
        let lines = contents.split(separator: "\n")

        // Emtpty 2D array
        var input = Array(
            repeating: Array(
                repeating: "",
                count: lines[0].count
            ),
            count: lines.count
        )

        for (li, line) in lines.enumerated() {
            for (ci, c) in line.enumerated() {
                input[li][ci] = String(c)
            }
        }

        return input
    }
}

let result = try Day_4.solution(.main)
print(result)