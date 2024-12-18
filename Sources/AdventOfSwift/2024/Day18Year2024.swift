class Day18Year2024 {
  static func partOne(lines: [String], takingFirst bytesToConsider: Int = 1024) -> Int {
    let bytes = parse(lines)
    let (xSize, ySize) = (bytes.map(\.x).max()!, bytes.map(\.y).max()!)
    
    return findPath(from: Set([Point(x: 0, y: 0)]), to: Point(x: xSize, y: ySize), avoiding: Set(bytes.dropLast(bytes.count - bytesToConsider)))
  }
  
  static func partTwo(lines: [String]) -> String {
    let bytes = parse(lines)
    let (xSize, ySize) = (bytes.map(\.x).max()!, bytes.map(\.y).max()!)
    
    var (low, high) = (0, bytes.count)
    while low < high {
      let mid = (low + high) / 2
      let subset = bytes[0...mid]
      let path = findPath(from: Set([Point(x: 0, y: 0)]), to: Point(x: xSize, y: ySize), avoiding: Set(subset))
      if path > 0 {
        low = mid + 1
      } else {
        high = mid
      }
    }
    
    return "\(bytes[low].x),\(bytes[high].y)"
  }
  
  private static func parse(_ lines: [String]) -> [Point] {
    lines.map {
      let coordinates = $0.split(separator: ",").compactMap { Int($0) }
      return Point(x: coordinates[0], y: coordinates[1])
    }
  }
  
  private static func findPath(from points: Set<Point>, to exit: Point, avoiding bytes: Set<Point>, withSteps steps: Int = 0) -> Int {
    if points.anySatisfies({ $0 == exit }) {
      return steps
    }
    
    let next = points.flatMap { $0.orthogonalNeighbors() }
      .filter { (n: Point) in !points.contains(n) && !bytes.contains(n) }
      .filter { (n: Point) in n.x >= 0 && n.y >= 0 && n.x <= exit.x && n.y <= exit.y }
    return !next.isEmpty ? findPath(from: points.union(Set(next)), to: exit, avoiding: bytes, withSteps: steps + 1) : -1
  }
}
