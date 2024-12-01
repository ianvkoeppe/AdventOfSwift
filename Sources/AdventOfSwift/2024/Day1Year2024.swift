class Day1Year2024 {
  static func partOne(lines: [String]) -> Int {
    let (left, right) = parse(lines)
    return zip(left.sorted(), right.sorted()).map { abs($0 - $1) }.sum()
  }
  
  static func partTwo(lines: [String]) -> Int {
    let (left, right) = parse(lines)
    let counts = right.grouping().eachCount()
    return left.sum { $0 * (counts[$0] ?? 0) }
  }
  
  private static func parse(_ lines: [String]) -> ([Int], [Int]) {
    let nums = lines.map { $0.asInts(separator: " ") }
    return (nums.map(\.first!), nums.map(\.last!))
  }
}
