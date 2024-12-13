class Day13Year2024 {
  struct ClawMachine {
    let a, b, prize: Point
  }
  
  class Arcade {
    let machines: [ClawMachine]
    
    init(lines: [String], bonus: Int = 0) {
      self.machines = lines.joined(separator: "\n").split(separator: "\n\n").map { section in
        let machineDefinition = section.split(separator: "\n")
        let aButtonDefinition = String(machineDefinition[0]).substring(after: ": ").split(separator: ", ")
        let aButton = Point(x: Int(String(aButtonDefinition[0]).substring(after: "+"))!, y: Int(String(aButtonDefinition[1]).substring(after: "+"))!)
        let bButtonDefinition = String(machineDefinition[1]).substring(after: ": ").split(separator: ", ")
        let bButton = Point(x: Int(String(bButtonDefinition[0]).substring(after: "+"))!, y: Int(String(bButtonDefinition[1]).substring(after: "+"))!)
        let prizeDefinition = String(machineDefinition[2]).substring(after: ": ").split(separator: ", ")
        let prize = Point(x: Int(String(prizeDefinition[0]).substring(after: "="))! + bonus, y: Int(String(prizeDefinition[1]).substring(after: "="))! + bonus)
        return ClawMachine(a: aButton, b: bButton, prize: prize)
      }
    }
    
    func findMinimumTokensToWin() -> Int {
      machines.sum { findMinimumTokensToWin(on: $0) }
    }
    
    private func findMinimumTokensToWin(on machine: ClawMachine) -> Int {
      let x = (machine.prize.y * machine.b.x - machine.b.y * machine.prize.x) / (machine.b.x * machine.a.y - machine.b.y * machine.a.x)
      let y = (machine.prize.x - machine.a.x * x) / machine.b.x
      
      let solvesX = machine.a.x * x + machine.b.x * y == machine.prize.x
      let solvesY = machine.a.y * x + machine.b.y * y == machine.prize.y
      return solvesX && solvesY ? 3 * x + y : 0
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    Arcade(lines: lines).findMinimumTokensToWin()
  }
  
  static func partTwo(lines: [String]) -> Int {
    Arcade(lines: lines, bonus: 10000000000000).findMinimumTokensToWin()
  }
}
