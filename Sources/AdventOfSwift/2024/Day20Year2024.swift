class Day20Year2024 {
  class RaceConditionCheater {
    let grid: [[Character]]
    let start, end: Point
    
    init(lines: [String]) {
      let grid = lines.map(Array.init)
      self.grid = grid
      self.start = grid.firstIndices { (x, y) in grid[y][x] == "S" }.map(Point.init)!
      self.end = grid.firstIndices { (x, y) in grid[y][x] == "E" }.map(Point.init)!
    }
    
    func countCheats(ofLengthLessThan maxLength: Int) -> Int {
      let distanceFromStart = findShortestPaths(from: start, to: end)
      let distanceTilEnd = findShortestPaths(from: end, to: start)
      
      var cheats: Set<LineSegment> = []
      for point in distanceFromStart.keys {
        for other in distanceFromStart.keys {
          if point != other {
            let d = point.manhanttanDistance(to: other)
            if d <= maxLength && distanceTilEnd[other]! + d < distanceTilEnd[point]! {
              cheats.insert(LineSegment(start: point, end: other))
            }
          }
        }
      }
      
      return cheats
        .map { distanceFromStart[$0.start]! + distanceTilEnd[$0.end]! + $0.start.manhanttanDistance(to: $0.end) }
        .count { distanceTilEnd[start]! - $0 >= 100 }
    }
    
    private func findShortestPaths(from start: Point, to end: Point) -> [Point:Int] {
      var count = 0
      var point: Point? = start
      var shortestPaths: [Point:Int] = [:]
      while point != nil {
        shortestPaths[point!] = count
        point = point!.neighbors().first { n in grid[n] != "#" && shortestPaths[n] == nil }
        count += 1
      }
      
      return shortestPaths
    }
  }
  
  static func partOne(lines: [String]) -> Int { RaceConditionCheater(lines: lines).countCheats(ofLengthLessThan: 2) }
  
  static func partTwo(lines: [String]) -> Int { RaceConditionCheater(lines: lines).countCheats(ofLengthLessThan: 20) }
}
