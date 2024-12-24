class Day21Year2024 {
  private class KeyPad {
    private static let priorities: [Character] = ["<", "^", "v", ">"]
    
    private let keyPad: [[Character]]
    private let buttons: [Character:Point]
    private var point: Point
    
    init(keyPad: [[Character]]) {
      self.keyPad = keyPad
      self.buttons = Dictionary(uniqueKeysWithValues:
        keyPad.indices { (x, y) in true }.map { (x, y) in (keyPad[y][x], Point(x: x, y: y)) }
      )
      self.point = buttons["A"]!
    }
    
    func push(button: Character) -> String {
      let (from, to) = (point, buttons[button]!)
      point = to
      
      let (x, y) = (to.x - from.x, to.y - from.y)
      let leftRight = String(repeating: x > 0 ? ">" : "<", count: abs(x))
      let upDown = String(repeating: y > 0 ? "v" : "^", count: abs(y))
      
      return [leftRight + upDown, upDown + leftRight]
        .sorted { (f, s) in (KeyPad.priorities.firstIndex(of: f.first ?? " ") ?? 0) < (KeyPad.priorities.firstIndex(of: s.first ?? " ") ?? 0) }
        .first { candidate in
          !candidate
            .reduce([from]) { (points, direction) in points + [points.last!.advance(in: Direction.characters[direction]!)] }
            .anySatisfies { p in (keyPad[safe: p.y]?[safe: p.x] ?? " ") == " " }
        }! + "A"
    }
  }
  
  private class NumericalKeyPad: KeyPad {
    init() {
      super.init(keyPad: [
        ["7", "8", "9"],
        ["4", "5", "6"],
        ["1", "2", "3"],
        [" ", "0", "A"]
      ])
    }
  }
  
  private class DirectionalKeyPad: KeyPad {
    init() {
      super.init(keyPad: [
        [" ", "^", "A"],
        ["<", "v", ">"]
      ])
    }
  }
  
  private class Robot {
    let keyPad: KeyPad
    let next: Robot?
    
    init(keyPad: KeyPad, next robot: Robot? = nil) {
      self.keyPad = keyPad
      self.next = robot
    }
    
    func findStepsToEnter(_ code: String) -> [String:Int] {
      let steps = next?.findStepsToEnter(code) ?? [code: 1]
      return Dictionary(steps.flatMap { (k, v) in k.map { s in (keyPad.push(button: s), v) } }, uniquingKeysWith: +)
    }
  }
  
  private class Robots {
    let robot: Robot
    let codes: [String]
    
    init(lines: [String], n: Int) {
      self.robot = (1...n).reduce(Robot(keyPad: NumericalKeyPad())) { (robot, _) in Robot(keyPad: DirectionalKeyPad(), next: robot) }
      self.codes = lines
    }
    
    func countStepsToEnterCodes() -> Int {
      return codes.sum { code in
        let steps = robot.findStepsToEnter(code).map { (k, v) in k.count * v }.sum()
        let codeNumbers = Int(code.filter(\.isNumber).map(String.init).joined())!
        return steps * codeNumbers
      }
    }
  }
  
  static func partOne(lines: [String]) -> Int { Robots(lines: lines, n: 2).countStepsToEnterCodes() }
  
  static func partTwo(lines: [String]) -> Int { Robots(lines: lines, n: 25).countStepsToEnterCodes() }
}
