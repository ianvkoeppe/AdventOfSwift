enum Direction: CaseIterable {
  case north, east, south, west
  
  func axis() -> Axis {
    self == .north || self == .south ? .x : .y
  }
  
  func right() -> Direction {
    Direction.allCases[(Direction.allCases.firstIndex(of: self)! + 1) % Direction.allCases.count]
  }
}
