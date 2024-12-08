class Day8Year2024 {
  static func partOne(lines: [String]) -> Int {
    locateAntinodes(in: lines).count
  }
  
  static func partTwo(lines: [String]) -> Int {
    locateAntinodes(in: lines, untilDistanceOf: .max).count
  }
  
  private static func locateAntinodes(in lines: [String], untilDistanceOf distance: Int = 1) -> Set<Point> {
    let grid = lines.map(Array.init)
    let nodes = grid.enumerated().flatMap { y, row in
      row.enumerated().compactMap { x, v in
        v != "." ? (v, Point(x: x, y: y)) : nil
      }
    }.grouping { $0.0 }.map { $0.value.map { $0.1 } }
    
    return Set(nodes.flatMap { locations in
      let pairs = locations.flatMap { location in locations.compactMap { other in location != other ? (location, other) : nil } }
      return pairs.flatMap { first, second in
        let prev: (Point) -> Point = { Point(x: $0.x - (second.x - first.x), y: $0.y - (second.y - first.y)) }
        let next: (Point) -> Point = { Point(x: $0.x + (second.x - first.x), y: $0.y + (second.y - first.y)) }
        
        return locateAntinodes(in: grid, from: first, withNext: prev, untilDistanceOf: distance)
          .union(locateAntinodes(in: grid, from: second, withNext: next, untilDistanceOf: distance))
      }
    })
  }
  
  private static func locateAntinodes(in grid: [[Character]], from antena: Point, withNext next: (Point) -> Point, untilDistanceOf distance: Int) -> Set<Point> {
    var count = 0
    var antis: [Point] = distance > 1 ? [antena] : []
    while grid[safe: next(antis.last ?? antena)] != nil && count < distance {
      antis.append(next(antis.last ?? antena))
      count += 1
    }
    return Set(antis)
  }
}
