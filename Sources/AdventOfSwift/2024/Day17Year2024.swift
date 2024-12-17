import Foundation

class Day17Year2024 {
  class Computer {
    private static let operandToRegister: [Int:Character] = [4: "A", 5: "B", 6: "C"]
    
    private let program: [Int]
    private var pointer: Int = 0
    private var registers: [Character:Int]
    private var output: [Int] = []
    
    init(lines: [String]) {
      let sections = lines.joined(separator: "\n").split(separator: "\n\n")
      self.registers = Dictionary(uniqueKeysWithValues: sections[0].split(separator: "\n").map {
        let register = String($0).substring(after: "Register ").split(separator: ": ")
        return (register[0].first!, Int(register[1])!)
      })
      self.program = String(sections[1]).substring(after: "Program: ").split(separator: ",").compactMap { Int(String($0))! }
    }
    
    init(program: [Int], registers: [Character:Int]) {
      self.registers = registers
      self.program = program
    }
    
    func runUntilSelfReplicating() -> Int { runUntilSelfReplicating(withRegisterValue: 0, matching: program.endIndex - 1) }
  
    private func runUntilSelfReplicating(withRegisterValue a: Int, matching digit: Int) -> Int {
      if digit >= 0 {
        for i in (0...8) {
          let output = Computer(program: program, registers: registers.merging(["A": a * 8 + i], uniquingKeysWith: { $1 })).run()
          
          if Array(program[digit..<program.endIndex]) == output { // Possible match but must verify it satisfies previous digit as well.
            let prev = runUntilSelfReplicating(withRegisterValue: a * 8 + i, matching: digit - 1)
            let prevOutput = Computer(program: program, registers: registers.merging(["A": prev], uniquingKeysWith: { $1 })).run()
            
            if program == prevOutput || Array(program[(digit - 1)..<program.endIndex]) == prevOutput {
              return prev
            }
          }
        }
      }
      
      return a
    }

    func run() -> [Int] {
      while pointer < program.endIndex {
        let (code, operand) = (program[pointer], program[pointer + 1])
        
        switch code {
          case 0:
            registers["A"] = adv(operand: operand)
          case 1:
            registers["B"] = registers["B"]! ^ operand
          case 2:
            registers["B"] = combo(of: operand) % 8
          case 3:
            pointer = registers["A"] != 0 ? operand - 2 : pointer
          case 4:
            registers["B"] = registers["B"]! ^ registers["C"]!
          case 5:
            output.append(combo(of: operand) % 8)
          case 6:
            registers["B"] = adv(operand: operand)
          default:
            registers["C"] = adv(operand: operand)
        }
        pointer += 2
      }
      
      return output
    }
    
    private func combo(of operand: Int) -> Int { Computer.operandToRegister[operand].flatMap { registers[$0] } ?? operand }
    
    private func adv(operand: Int) -> Int { registers["A"]! / Int(truncating: pow(2, combo(of: operand)) as NSDecimalNumber) }
  }
  
  static func partOne(lines: [String]) -> String { Computer(lines: lines).run().joined(String.init, separator: ",") }
  
  static func partTwo(lines: [String]) -> Int { Computer(lines: lines).runUntilSelfReplicating() }
}
