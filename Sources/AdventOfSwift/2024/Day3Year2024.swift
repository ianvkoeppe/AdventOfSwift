class Day3Year2024 {
  static func partOne(lines: [String]) -> Int {
    findMuls(in: lines.joined())
  }
  
  static func partTwo(lines: [String]) -> Int {
    return ("do()" + lines.joined()).split(separator: "don't()")
      .sum { findMuls(in: String($0).substring(after: "do()", or: "")) }
  }
  
  private static func findMuls(in str: String) -> Int {
    return str.matches(of: /mul\(([0-9]+),([0-9]+)\)/).map(\.output).map { Int($0.1)! * Int($0.2)! }.sum()
  }
}
