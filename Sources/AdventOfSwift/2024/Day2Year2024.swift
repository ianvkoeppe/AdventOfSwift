class Day2Year2024 {
  private static let valid: Set = [1, 2, 3]
  
  static func partOne(lines: [String]) -> Int {
    lines.count { line in
      line.asInts(separator: " ").satisfiesInEitherDirection { report in
        Set(report.zipWithNext().map(-)).isSubset(of: valid)
      }
    }
  }
  
  static func partTwo(lines: [String]) -> Int {
    lines.count { line in
      line.asInts(separator: " ").satisfiesInEitherDirection(isSafeWithSingleTolerance)
    }
  }
  
  private static func isSafeWithSingleTolerance(_ report: [Int]) -> Bool {
    let differences = report.zipWithNext().map(-)
    let unsafeLevels = differences.enumerated().filter { !valid.contains($1) }
    
    switch unsafeLevels.count {
      case 2:
        // If two bad values, they must be adjacent and their sums satisfy the safety requirement.
        return abs(unsafeLevels[0].offset - unsafeLevels[1].offset) == 1 && (valid.contains(unsafeLevels.map(\.element).sum()))
      case 1:
        // If a single bad value, it must either be on the edge or mergeable with an adjacent level without violating safety requirement.
        return [differences[safe: unsafeLevels.first!.offset - 1], differences[safe: unsafeLevels.first!.offset + 1]]
          .anySatisfies { $0 == nil || valid.contains($0! + unsafeLevels.first!.element) }
      default:
        // Otherwise, we can only meet safety requirement if all levels are already safe.
        return differences.allSatisfy { valid.contains($0) }
    }
  }
}
