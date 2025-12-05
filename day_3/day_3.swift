import Foundation

enum Day_3 {

    static func solution() throws -> Int {
        let contents = try String(contentsOfFile: "day_3_input.txt", encoding: .utf8)
        let lines = contents.split(separator: "\n")

        var sum = 0

        for line in lines {
            var max: Int?
            var second: Int?
            let line = Array(line)
            var i = 0

            while i < line.count {
                let digit = Int(String(line[i]))!
                
                if (max == nil || (max != nil && digit > max!)) && i < line.count - 1 {
                    max = digit
                    second = nil
                } else if second == nil || (second != nil && digit > second!) {
                    second = digit
                }
                i += 1
            }

            sum += max! * 10 + second!
        }

        return sum
    }   
}

let result = try Day_3.solution()
print(result)