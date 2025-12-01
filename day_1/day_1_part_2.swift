import Foundation

/*
    Return:
    - include times going through 0

    Approach:
    - Take signedCount / 100 value
    - Add 1 to it if total >99 or <0
*/

enum Day_1_Part_2 {

    static func solution() throws -> Int {
        var pos = 50
        var result = 0
        
        let contents = try String(contentsOfFile: "day_1_input.txt", encoding: .utf8)
        let lines = contents.split(separator: "\n")

        for move in lines.map(Array<Character>.init) {
            let sign = move[0] == "R" ? 1 : -1
            let count = Int(String(move[1...move.count - 1]))!

            let signedCount = (sign * count) % 100
            let throughZeroCount = (sign * count) / 100
            let total = pos + signedCount

            if total > 99 {
                pos = total % 100
                result += pos != 0 ? 1 : 0
            } else if total < 0 {
                let oldPos = pos
                pos = 100 - abs(total)
                result += oldPos != 0 ? 1 : 0
            } else {
                pos = total
            }

            result += pos == 0 ? 1 : 0
            result += abs(throughZeroCount)
        }

        return result
    }
}

let result = try Day_1_Part_2.solution()
print(result)