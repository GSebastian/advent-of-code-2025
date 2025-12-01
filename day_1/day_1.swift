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

    Branchy approach:
        - work with (count * sign) % 10
            - signedCount + pos > 99 -> total % 100
            - signedCount + pos < 0 -> 100 - abs(total)
                - 50 - 53 == -3; expect 97 == 100 - 3
            - else signedCount + pos
    
    Clean approach:
        - work with the total sum
        - pos == 50. Add 300. 350 % 100 == 50 (correct)
        - pos == 50. Subtract 170. -120 % 100 == -20. But this should be 80.
            - + 100 - now we have 80
        - -120 % 100 and 350 % 100 are common to both cases. But adding 100 is only in the negative case
            - can be negated by % 100 in the positive case to obtain a single formula

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

            let signedCount = sign * count
            let total = pos + signedCount

            pos = (100 + (total % 100)) % 100

            // Branchy logic:
            // pos = if total > 99 {
            //     total % 100
            // } else if total < 0 {
            //     100 - abs(total)
            // } else {
            //     total
            // }

            if pos == 0 { result += 1 }
        }

        return result
    }
}

let result = try Day_1.solution()
print(result)