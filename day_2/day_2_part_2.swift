import Foundation

enum Day_2_Part_2 {

    static func solution() throws -> Int {
        let contents = try String(contentsOfFile: "day_2_input.txt", encoding: .utf8)
        let intervals = contents.split(separator: ",")

        var sum = 0

        for interval in intervals {            
            let split = interval.split(separator: "-")
            let lhs = Int(split[0])!
            let rhs = Int(split[1])!
            interval: for n in lhs...rhs where n > 9 {
                let nAsString = Array(String(n))
                let stringLength = nAsString.count

                var divisors: [Int] = []
                for i in 1...(stringLength/2) where stringLength % i == 0 {
                    divisors.append(i)
                }

                windowSize: for windowSize in divisors {
                    var offset = 0
                    while offset < windowSize {
                        let characterInWindow = nAsString[0 + offset]
                        for windowI in 0...(stringLength / windowSize) - 1 {
                            let character = nAsString[windowI * windowSize + offset]
                            if character != characterInWindow {
                                continue windowSize
                            }
                        }
                        offset +=  1
                    }
                    sum += n
                    continue interval
                }
            }
        }
        return sum
    }
}

let result = try Day_2_Part_2.solution()
print(result)