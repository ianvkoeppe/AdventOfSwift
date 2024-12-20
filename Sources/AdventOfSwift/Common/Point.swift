public struct Point: CustomStringConvertible, Hashable, Sendable {
  private static let adjacencies = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, -1), (-1, 1), (-1, -1), (1, 1)]
  private static let orthogonal = [(0, 1), (1, 0), (0, -1), (-1, 0)]
  
  let x: Int, y: Int
  
  public var description: String { return "(\(x), \(y))" }
  
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
  
  func manhanttanDistance(to other: Point) -> Int {
    abs(other.x - x) + abs(other.y - y)
  }
  
  func neighbors(by factor: Int = 1) -> [Point] {
    Point.adjacencies.map { Point(x: $0.0 + (x * factor), y: $0.1 + (y * factor)) }
  }

  func orthogonalNeighbors() -> [Point] {
    Point.orthogonal.map { Point(x: $0.0 + x, y: $0.1 + y) }
  }
  
  func orthogonalPositions() -> [Position] {
    [Position(point: up(), direction: .north),
     Position(point: right(), direction: .east),
     Position(point: down(), direction: .south),
     Position(point: left(), direction: .west)]
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
