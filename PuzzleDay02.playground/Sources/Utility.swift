import Foundation

public struct Utility {
    
    /**
     The spreadsheet consists of rows of apparently-random numbers. To make sure the recovery process is on the right track, they need you to calculate the spreadsheet's checksum. For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.
     
     For example, given the following spreadsheet:
     
     5 1 9 5
     7 5 3
     2 4 6 8
     
     - The first row's largest and smallest values are 9 and 1, and their difference is 8.
     - The second row's largest and smallest values are 7 and 3, and their difference is 4.
     - The third row's difference is 6.
     
     In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
     
     - Parameter input: varadic input of array of Int
     - Returns: it'll return the checksum as a Int
     */
    public static func curruptionChecksum(_ input: [[Int]]) -> Int {
        
        let result = input.map({
            ($0.max() ?? 0) - ($0.min() ?? 0)
        }).reduce(0) {
            return $0 + $1
        }
        
        return result
    }
    
    
    /// convert the string to array of array of Int, check the input in README.md file
    ///
    /// - Parameter inputString: pass the multiline string in row & column style
    /// - Returns: return the array of array of int
    public static func convertStringToArrayOfInt(_ inputString: String) -> [[Int]] {
        
        let arrayOfString = inputString.components(separatedBy: "\n")
            .map { $0.components(separatedBy: " ")
                .filter { !$0.isEmpty} }
        
        var arrayOfArrayInt = [[Int]]()
        
        for stringValue in arrayOfString {
            var arrayOfInt = [Int]()
            for character in stringValue {
                arrayOfInt.append(Int("\(character)")!)
            }
            arrayOfArrayInt.append(arrayOfInt)
        }
        
        return arrayOfArrayInt
    }
}
