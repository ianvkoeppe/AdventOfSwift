class Day14Year2024 {
  struct Robot: Sendable {
    let point: Point, velocity: Point
  }
  
  static func partOne(lines: [String], xSize: Int = 101, ySize: Int = 103) -> Int {
    let robots = parse(lines).map { move(robot: $0, withinX: xSize, andY: ySize, forSteps: 100) }
    return groupingByQuadrants(robots: robots, withinX: xSize, andY: ySize).map { $0.value.count }.reduce(1, *)
  }
  
  static func partTwo(lines: [String], xSize: Int = 101, ySize: Int = 103) async -> Int {
    let robots = parse(lines)
    
    return await withTaskGroup(of: Int?.self) { group in
      for interval in (1...findCycle(in: robots, withinX: xSize, andY: ySize)) {
        group.addTask {
          let moved = robots.map { move(robot: $0, withinX: xSize, andY: ySize, forSteps: interval) }
          return formingATreeTop(robots: moved) ? interval : nil
        }
      }
      
      return await group.compactMap { $0 }.min()!
    }
  }
  
  private static func parse(_ lines: [String]) -> [Robot] {
    lines.map { line in
      let sections = line.split(separator: " ")
      let point = String(sections[0]).substring(after: "p=").split(separator: ",").compactMap { Int($0) }
      let velocity = String(sections[1]).substring(after: "v=").split(separator: ",").compactMap { Int($0) }
      return Robot(point: Point(x: point[0], y: point[1]), velocity: Point(x: velocity[0], y: velocity[1]))
    }
  }
  
  private static func findCycle(in robots: [Robot], withinX xBound: Int, andY yBound: Int) -> Int {
    var count = 1
    var moved = robots.map { move(robot: $0, withinX: xBound, andY: yBound) }
    while moved.map({ $0.point }) != robots.map({ $0.point }) {
      moved = moved.map { move(robot: $0, withinX: xBound, andY: yBound) }
      count += 1
    }
    return count
  }

  private static func move(robot: Robot, withinX xBound: Int, andY yBound: Int, forSteps steps: Int = 1) -> Robot {
    let x = (robot.point.x + (robot.velocity.x * steps)) %% xBound
    let y = (robot.point.y + (robot.velocity.y * steps)) %% yBound
    return Robot(point: Point(x: x, y: y), velocity: robot.velocity)
  }

  private static func groupingByQuadrants(robots: [Robot], withinX xBound: Int, andY yBound: Int) -> [Int:[Robot]] {
    robots.grouping { robot in
      let yQuadrant = (robot.point.y - 1) / (yBound / 2)
      let xQuadrant = (robot.point.x - 1) / (xBound / 2) + yQuadrant
      return robot.point.x == (xBound / 2) || robot.point.y == (yBound / 2) ? -1 : xQuadrant + yQuadrant
    }.filter { $0.key >= 0 }
  }
  
  /*
   * Looking for...
   *      #
   *     ###
   *    #####
   */
  private static func formingATreeTop(robots: [Robot]) -> Bool {
    let points = Set(robots.map { $0.point })
    return points.anySatisfies { point in
      let nextThree = (-1...1).map { x in Point(x: point.x + x, y: point.y + 1) }
      let nextFive = (-2...2).map { x in Point(x: point.x + x, y: point.y + 2) }
      return nextThree.allSatisfy(points.contains) && nextFive.allSatisfy(points.contains)
    }
  }
}
