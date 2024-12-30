class Day25Year2024 {
  static func partOne(lines: [String]) -> Int {
    let schemata = parse(lines)
    let locks = schemata.filter { $0[0].allSatisfy { $0 == "#" } }
    let keys = schemata.filter { $0[$0.endIndex - 1].allSatisfy { $0 == "#" } }
    
    return locks.map { lock in
      keys.count { key in
        zip(maxHeight(in: lock, for: "#"), maxHeight(in: key, for: ".")).allSatisfy { $0.0 <= $0.1 }
      }
    }.sum()
  }
  
  private static func parse(_ lines: [String]) -> [[[Character]]] {
    lines.joined(separator: "\n").split(separator: "\n\n").map { schemata in schemata.split(separator: "\n").map(Array.init) }
  }
  
  private static func maxHeight(in grid: [[Character]], for character: Character) -> [Int] {
    return (0..<grid[0].endIndex).map { x in
      (0..<grid.endIndex).first { y in grid[y][x] != character }!
    }
  }
}
