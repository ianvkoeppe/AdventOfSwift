struct LineSegment: Hashable {
  let start, end: Point
  
  func points() -> Set<Point> {
    let xs = (min(start.x, end.x)...max(start.x, end.x)).map { x in Point(x: x, y: start.y) }
    let ys = (min(start.y, end.y)...max(start.y, end.y)).map { y in Point(x: start.x, y: y) }
    return Set(xs).union(ys)
  }
}
