/*
    Return: 
    - number of times 0 reached

    Inputs: 
    - 100 numbers, 0 to 99
    - dial points at 50
    - L/R<number_of_clicks>

    Assumptions:
    - input size: any
    - input format: as above
    - input correctly formatted: yes

    Edge cases:
    - no items in input: answer is 0 (starts at 50)

    Approach: 
    - Keep track of current position
    - While line available in input
    - Parse direction and count
    - sign: direction == L ? -1 : 1
    - key: 50 - 51 is the same as 50 - 151, same as 50 - 251 etc. Mod by 10
    - work with (count * sign) % 10
        - signedCount + pos > 99 -> total % 100
        - signedCount + pos < 0 -> 100 - abs(total)
            - 50 - 53 == -3; expect 97 == 100 - 3
        - else signedCount + pos
*/

import Foundation

enum Day_1 {

    static func solution() throws -> Int {
        var pos = 50
        var result = 0
        
        let contents = try String(contentsOfFile: "day_1_input.txt", encoding: .utf8)
        let lines = contents.split(separator: "\n")

        for move in lines.map(Array<Character>.init) {
            let sign = move[0] == "R" ? 1 : -1
            let count = Int(String(move[1...move.count - 1]))!

            let signedCount = (sign * count) % 100
            let total = pos + signedCount

            pos = if total > 99 {
                total % 100
            } else if total < 0 {
                100 - abs(total)
            } else {
                total
            }

            if pos == 0 { result += 1 }
        }

        return result
    }
}

let result = try Day_1.solution()
print(result)