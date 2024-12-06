class Day6Year2024 {
  class SuitLab {
    private let directions: [Character:Direction] = ["^": .north, ">": .east, "v": .south, "<": .west]
    private let nextObstacle: [Direction:(Point, [Int]) -> Point?] = [
      .north: { p, os in os.reversed().first { $0 < p.y }.map { Point(x: p.x, y: $0 + 1) } },
      .east: { p, os in os.first { $0 > p.x }.map { Point(x: $0 - 1, y: p.y) } },
      .south: { p, os in os.first { $0 > p.y }.map { Point(x: p.x, y: $0 - 1) } },
      .west: { p, os in os.reversed().first { $0 < p.x }.map { Point(x: $0 + 1, y: p.y) } }
    ]
    private let grid: [[Character]]
    private let obstacles: [AxisLine:[Int]]
    private let start: Position
    
    init(lines: [String]) {
      let grid = lines.map(Array.init)
      let guardLocation = grid.firstIndices { x, y in !Set([".", "#"]).contains(grid[y][x]) }.map(Point.init)!
      self.grid = grid
      self.start = Position(point: guardLocation, direction: directions[grid[safe: guardLocation]!]!)
      self.obstacles = grid.enumerated().flatMap { y, row in
        row.enumerated().flatMap { x, v in
          return v == "#" ? [(AxisLine(axis: .x, position: x), y), (AxisLine(axis: .y, position: y), x)] : []
        }
      }.grouping { $0.0 }.mapValues { $0.map { $0.1 } }
    }
    
    func findGuardSquares() -> Set<Point> {
      Set(findPathOutOfLab(blockedBy: obstacles).flatMap { $0.points() })
    }
    
    func countPossibleLoops() -> Int {
      return findGuardSquares().count { square in
        var obstacles = self.obstacles
        obstacles[AxisLine(axis: .x, position: square.x)] = ((obstacles[AxisLine(axis: .x, position: square.x)] ?? []) + [square.y]).sorted()
        obstacles[AxisLine(axis: .y, position: square.y)] = ((obstacles[AxisLine(axis: .y, position: square.y)] ?? []) + [square.x]).sorted()
        return findPathOutOfLab(blockedBy: obstacles) == []
      }
    }
    
    private func findPathOutOfLab(blockedBy obstacles: [AxisLine:[Int]]) -> Set<LineSegment> {
      var pos: Position? = start
      var visited: Set<LineSegment> = []
      while pos != nil {
        if let path = findNextObstacle(from: pos!, blockedBy: obstacles) {
          if visited.contains(path) {
            return [] // No path out, found a loop.
          }
          visited.insert(path)
          pos = Position(point: path.end, direction: pos!.direction.right())
        } else {
          // No obstacle found, so follow direction until the edge.
          var here = pos!.point
          while grid[safe: here] != nil {
            here = here.advance(in: pos!.direction)
          }
          visited.insert(LineSegment(start: pos!.point, end: here.reverse(in: pos!.direction)))
          pos = nil
        }
      }
      return visited
    }
    
    private func findNextObstacle(from pos: Position, blockedBy obstacles: [AxisLine:[Int]]) -> LineSegment? {
      let obstacles = obstacles[pos.axisLine()] ?? []
      return nextObstacle[pos.direction]!(pos.point, obstacles).map { LineSegment(start: pos.point, end: $0) }
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    SuitLab(lines: lines).findGuardSquares().count
  }
  
  static func partTwo(lines: [String]) -> Int {
    SuitLab(lines: lines).countPossibleLoops()
  }
}
