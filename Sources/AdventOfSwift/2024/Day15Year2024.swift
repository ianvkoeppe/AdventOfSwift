class Day15Year2024 {
  private struct WideObject: Hashable {
    let start, end: Point
    
    func advance(in direction: Direction) -> WideObject {
      WideObject(start: start.advance(in: direction), end: end.advance(in: direction))
    }
    
    func points() -> Set<Point> { LineSegment(start: start, end: end).points() }
  }
  
  private class GoodsPositioningSystem {
    private static let directions: [Character:Direction] = ["^": .north, ">": .east, "v": .south, "<": .west]
    
    let instructions: [Character]
    let walls: Set<Point>
    var boxesByPoints: [Point:WideObject] = [:]
    let initial: Point
    
    init(lines: [String], scaleBy factor: Int = 1) {
      let sections = lines.joined(separator: "\n").split(separator: "\n\n")
      let grid = sections[0].split(separator: "\n").map(Array.init)
      self.instructions = Array(String(sections[1].replacing("\n", with: "")))
      self.walls = Set(grid.indices { (x, y) in grid[y][x] == "#" }.flatMap { (x, y) in
        WideObject(start: Point(x: factor * x, y: y), end: Point(x: factor * x + (factor - 1), y: y)).points()
      })
      self.boxesByPoints = Dictionary(uniqueKeysWithValues: grid.indices { (x, y) in grid[y][x] == "O" }
        .map { (x, y) in WideObject(start: Point(x: x * factor, y: y), end: Point(x: x * factor + factor - 1, y: y)) }
        .flatMap { box in box.points().map { ($0, box) } }
      )
      let (initalX, initialY) = grid.firstIndices { (x, y) in grid[y][x] == "@" }!
      self.initial = Point(x: initalX * factor, y: initialY)
    }
    
    func followDirections() {
      var position = initial
      instructions.forEach { instruction in
        let next = position.advance(in: GoodsPositioningSystem.directions[instruction]!)
        
        var boxPoints: [Set<Point>] = [boxesByPoints[next] != nil ? boxesByPoints[next]!.points() : [next]]
        while !Set(boxesByPoints.keys).isDisjoint(with: boxPoints.last!) && walls.isDisjoint(with: boxPoints.last!) {
          let nextBoxPoints = Set(boxPoints.last!.map { point in point.advance(in: GoodsPositioningSystem.directions[instruction]!) }
            .flatMap { p in boxesByPoints[p]?.points().filter { !boxPoints.last!.contains($0) } ?? [p] }
            .filter { walls.contains($0) || boxesByPoints.keys.contains($0) })
          boxPoints.append(nextBoxPoints)
        }
        
        if walls.isDisjoint(with: boxPoints.last!) {
          let boxes = Set(boxPoints.flatMap { $0 }.filter(boxesByPoints.keys.contains).compactMap { boxesByPoints[$0] })
          if boxes.count > 0 {
            let newBoxes = boxes.map { $0.advance(in: GoodsPositioningSystem.directions[instruction]!) }
            boxes.forEach { box in box.points().forEach { point in boxesByPoints[point] = nil } }
            newBoxes.forEach { new in new.points().forEach { point in boxesByPoints[point] = new } }
          }
          
          position = next
        }
      }
    }
    
    func computeGPSCoordinates() -> Int { Set(boxesByPoints.values).sum { point in point.start.y * 100 + point.start.x } }
  }
  
  static func partOne(lines: [String]) -> Int {
    let gpsSystem = GoodsPositioningSystem(lines: lines)
    gpsSystem.followDirections()
    return gpsSystem.computeGPSCoordinates()
  }
  
  static func partTwo(lines: [String]) -> Int {
    let gpsSystem = GoodsPositioningSystem(lines: lines, scaleBy: 2)
    gpsSystem.followDirections()
    return gpsSystem.computeGPSCoordinates()
  }
}
