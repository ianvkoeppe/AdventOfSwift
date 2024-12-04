class Day4Year2024 {
  private static let adjacent = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1)]
  private static let slants = [[(-1, -1), (1, 1)], [(1, -1), (-1, 1)]]
  
  static func partOne(lines: [String]) -> Int {
    let grid = lines.map { Array($0) }
    return grid.sum { x, y in
      adjacent.count { (adjX, adjY) in
        let letters = (0...3).compactMap { distance in grid[safe: y + distance * adjY]?[safe: x + distance * adjX] }.joined(String.init)
        return letters == "XMAS"
      }
    }
  }
  
  static func partTwo(lines: [String]) -> Int {
    let grid = lines.map { Array($0) }
    return grid.sum { x, y in
      grid[y][x] == "A" && slants.allSatisfy { adjustments in
        let letters = adjustments.compactMap { adjX, adjY in grid[safe: y + adjY]?[safe: x + adjX] }.sorted().joined(String.init)
        return letters == "MS"
      } ? 1 : 0
    }
  }
}
