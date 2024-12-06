public struct Point: Hashable {
  let x: Int, y: Int
  
  func up() -> Point {
    Point(x: x, y: y - 1)
  }
  
  func right() -> Point {
    Point(x: x + 1, y: y)
  }
  
  func down() -> Point {
    Point(x: x, y: y + 1)
  }
  
  func left() -> Point {
    Point(x: x - 1, y: y)
  }
  
  func advance(in direction: Direction) -> Point {
    switch direction {
      case .north: return up()
      case .east: return right()
      case .south: return down()
      case .west: return left()
    }
  }
  
  func reverse(in direction: Direction) -> Point {
    switch direction {
      case .north: return down()
      case .east: return left()
      case .south: return up()
      case .west: return right()
    }
  }
}
