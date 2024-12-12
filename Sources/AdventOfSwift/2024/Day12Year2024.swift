class Day12Year2024 {
  class FenceBudgeter {
    let grid: [[Character]]
    let points: Set<Point>
    
    init(lines: [String]) {
      let grid = lines.map(Array.init)
      self.points = Set(grid.indices.flatMap { y in grid[y].indices.map { x in Point(x: x, y: y) } })
      self.grid = grid
    }
    
    func computeFencePriceByPerimeter() -> Int {
      let groups = points.chunk { point in findGroup(connectedWith: Set([point])) }
      return groups.sum { group in
        let perimeter = group.sum { point in 4 - point.orthogonalNeighbors().count { n in grid[safe: n] == grid[point] } }
        return group.count * perimeter
      }
    }
    
    func computeFencePriceBySides() -> Int {
      let groups = points.chunk { point in findGroup(connectedWith: Set([point])) }
      return groups.sum { group in
        let edges = Set(group.flatMap { point in
          point.orthogonalPositions().filter { n in grid[safe: n.point] != grid[point] }
        })
        let sides = edges.chunk { edge in findGroup(connectedWith: Set([edge]), from: edges) }
        return group.count * sides.count
      }
    }
    
    private func findGroup(connectedWith group: Set<Point>) -> Set<Point> {
      let next = group.flatMap { $0.orthogonalNeighbors().filter { n in !group.contains(n) && grid[safe: n] == grid[safe: group.first!] } }
      return next.isEmpty ? group : findGroup(connectedWith: group.union(Set(next)))
    }
    
    private func findGroup(connectedWith group: Set<Position>, from rest: Set<Position>) -> Set<Position> {
      let next = group.flatMap { pos in
        pos.point.orthogonalNeighbors()
          .map { Position(point: $0, direction: pos.direction) }
          .filter { pos in rest.contains(pos) && !group.contains(pos) }
      }
      return next.isEmpty ? group : findGroup(connectedWith: group.union(Set(next)), from: rest)
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    FenceBudgeter(lines: lines).computeFencePriceByPerimeter()
  }
  
  static func partTwo(lines: [String]) -> Int {
    FenceBudgeter(lines: lines).computeFencePriceBySides()
  }
}
