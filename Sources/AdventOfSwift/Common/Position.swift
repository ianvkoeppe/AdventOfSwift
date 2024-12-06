struct Position: Hashable {
  let point: Point
  let direction: Direction
  
  func axisLine() -> AxisLine {
    let axis = direction.axis()
    return AxisLine(axis: axis, position: axis == .x ? point.x : point.y)
  }
}
