import Collections

class Day16Year2024 {
  struct Path: Comparable {
    let positions: [Position]
    let cost: Int
    
    static func <(lhs: Path, rhs: Path) -> Bool {
      return lhs.cost < rhs.cost
    }
    
    static func ==(lhs: Path, rhs: Path) -> Bool {
      return lhs.cost == rhs.cost
    }
  }
  
  class ReindeerMaze {
    let grid: [[Character]]
    let start: Position
    
    init(lines: [String]) {
      let grid = lines.map(Array.init)
      self.start = grid.indices { (x, y) in grid[y][x] == "S" }
        .map { (x, y) in Position(point: Point(x: x, y: y), direction: .east) }
        .first!
      self.grid = grid
    }
    
    func findMinPath() -> Int { findPaths().map { $0.cost }.min()! }
    
    func findAllMinPathPoints() -> Int {
      let paths = findPaths()
      let min = paths.map { $0.cost }.min()!
      return Set(paths.filter { $0.cost == min }.flatMap { $0.positions }.compactMap { $0.point }).count
    }
    
    func findPaths() -> [Path] {
      var visited: [Position:Int] = [:]
      var heap = Heap([Path(positions: [start], cost: 0)])
      var paths: [Path] = []

      while !heap.isEmpty {
        let min = heap.popMin()!
        visited[min.positions.last!] = min.cost
        
        let next = [(min.positions.last!.forward(), 1), (min.positions.last!.turnCounterClockwise(), 1000), (min.positions.last!.turnClockwise(), 1000)]
          .filter { (next, cost) in !visited.keys.contains(next) && grid[safe: next.point] != "#" }
          .filter { (next, cost) in visited[next] == nil || visited[next]! >= min.cost + cost }
          .map { (next, cost) in Path(positions: min.positions + [next], cost: min.cost + cost) }
        
        next.forEach { heap.insert($0) } // heap.insert(contentsOf: next) is 30x slower.
        next.filter { n in grid[n.positions.last!.point] == "E" }.forEach { paths.append($0) }
      }
      
      return paths
    }
  }
  
  static func partOne(lines: [String]) -> Int { ReindeerMaze(lines: lines).findMinPath() }
  
  static func partTwo(lines: [String]) -> Int { ReindeerMaze(lines: lines).findAllMinPathPoints() }
}
