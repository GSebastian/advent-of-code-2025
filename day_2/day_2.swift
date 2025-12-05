import Foundation

enum Day_2 {

    static func solution() throws -> Int {
        let contents = try String(contentsOfFile: "day_2_input.txt", encoding: .utf8)
        let intervals = contents.split(separator: ",")

        var sum = 0

        for interval in intervals {
            let split = interval.split(separator: "-")
            let lhs = Int(split[0])!
            let rhs = Int(split[1])!
            interval: for n in lhs...rhs {
                let nAsString = Array(String(n))
                guard nAsString.count % 2 == 0 else { continue interval }

                var offset = 0
                while offset < nAsString.count / 2 {
                    let lIndex = nAsString.count / 2 - 1 - offset
                    let rIndex = nAsString.count - 1 - offset
                    guard nAsString[lIndex] == nAsString[rIndex] else {
                        continue interval
                    }
                    offset += 1
                }
                sum += n
            }
        }

        return sum
    }
}

let result = try Day_2.solution()
print(result)