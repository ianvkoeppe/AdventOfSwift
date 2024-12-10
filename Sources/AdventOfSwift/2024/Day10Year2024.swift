class Day10Year2024 {
  class TrailCounter {
    let grid: [[Int]]
    let zeros: [Point]
    
    init(lines: [String]) {
      let grid = lines.map(Array.init).map { row in row.map { Int(String($0))! } }
      self.zeros = grid.indices { (x, y) in grid[y][x] == 0 }.map(Point.init)
      self.grid = grid
    }
    
    func findReachableTrailEnds() -> [LineSegment] {
      zeros.flatMap { findReachableTrailEnds(from: $0, at: $0) }
    }
    
    func findReachableTrailEnds(from start: Point, at current: Point) -> [LineSegment] {
      if grid[current.y][current.x] == 9 {
        return [LineSegment(start: start, end: current)]
      }
      
      return current.orthogonalNeighbors()
        .filter { grid[safe: $0] == grid[current.y][current.x] + 1 }
        .flatMap { n in findReachableTrailEnds(from: start, at: n) }
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    Set(TrailCounter(lines: lines).findReachableTrailEnds()).count
  }
  
  static func partTwo(lines: [String]) -> Int {
    TrailCounter(lines: lines).findReachableTrailEnds().count
  }
}
