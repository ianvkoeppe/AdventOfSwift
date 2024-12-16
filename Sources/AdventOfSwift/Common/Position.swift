struct Position: Hashable {
  let point: Point
  let direction: Direction
  
  func axisLine() -> AxisLine {
    let axis = direction.axis()
    return AxisLine(axis: axis, position: axis == .x ? point.x : point.y)
  }
  
  func forward() -> Position {
    Position(point: point.advance(in: direction), direction: direction)
  }
  
  func turnClockwise() -> Position {
    Position(point: point, direction: direction.right())
  }
  
  func turnCounterClockwise() -> Position {
    Position(point: point, direction: direction.left())
  }
}
