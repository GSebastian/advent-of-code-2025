/*
818181911112111 • Answer: 888911112111

l = count - how many others needed - how many traversed
1: 15 - 11 - 0 = 4
2: 15 - 10 - 1 = 4
3: 15 - 9 - 3 = 3
4: 15 - 8 - 5 = 2
5: 15 - 7 - 7 = 1
6: 15 - 6 - 8 = 1

1 - 15 - 11 = 4
2 - 15 - 10 = 

- 1
8181 81911112111
8
- 2
8 1818 1911112111
   8
- 3
818 181 911112111
     8
- 4
81818 19 11112111
       9
- 5
8181819 1 1112111
        1
- 6
81818191 1 112111
         1 

Rinse and repeat

*/

import Foundation

enum Day_3_Part_2 {

    static func solution() throws -> Int {
        let contents = try String(contentsOfFile: "day_3_input.txt", encoding: .utf8)
        let lines = contents.split(separator: "\n")

        var total = 0
        for line in lines.map({ Array($0) }) {
            var lastFoundIndex = -1
            var found = 0
            var result = 0

            while found < 12 { 
                // Formula: 
                // window length = count - how many others needed - how many traversed
                let othersNeeded = 12 - found - 1
                let traversed = lastFoundIndex + 1 // indices are 0-indexed
                let windowLength = line.count - othersNeeded - traversed

                var maxForWindow = -1
                var length = 1
                let windowStart = lastFoundIndex
                while length <= windowLength {
                    let currentPosition = windowStart + length
                    let charAsInt = Int(String(line[currentPosition]))!
                    if charAsInt > maxForWindow { 
                        maxForWindow = charAsInt
                        lastFoundIndex = currentPosition
                    }
                    length += 1
                }

                result = result * 10 + maxForWindow
                found += 1
            }
            total += result
        }
        return total
    }   
}

let result = try Day_3_Part_2.solution()
print(result)