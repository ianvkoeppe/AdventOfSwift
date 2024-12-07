class Day7Year2024 {
  struct Equation {
    let values: [Int]
    let ans: Int
  }
  
  class BridgeCalibrator {
    private let equations: [Equation]
    private let supportedOperations: [String]
    private let shouldOperate: [String:(Int, Int) -> Bool] = [
      "||": { "\($0)".hasSuffix("\($1)") },
      "*": { $0 % $1 == 0 },
      "+": { $0 >= $1 }
    ]
    private let inverseOperations: [String:(Int, Int) -> Int] = [
      "||": { Int("\($0)".remove(suffix: "\($1)")) ?? 0 },
      "*": { $0 / $1 },
      "+": { $0 - $1 }
    ]
    
    init(lines: [String], withSupportedOperations operations: [String]) {
      self.equations = lines.map { line in
        let asInts = line.split(separator: ": ").map { String($0).asInts(separator: " ") }
        return Equation(values: asInts[1].reversed(), ans: asInts[0][0])
      }
      self.supportedOperations = operations
    }
    
    func findSumOfSolveableTestValues() -> Int {
      equations.filter { trySolve($0, startingAt: 0, withAnswer: $0.ans) }.map(\.ans).sum()
    }
    
    private func trySolve(_ equation: Equation, startingAt i: Int, withAnswer ans: Int) -> Bool {
      if ans == 0 && i == equation.values.endIndex  { return true }
      if i == equation.values.endIndex { return false }
      
      return supportedOperations
        .filter { op in shouldOperate[op]!(ans, equation.values[i]) }
        .anySatisfies { trySolve(equation, startingAt: i + 1, withAnswer: inverseOperations[$0]!(ans, equation.values[i])) }
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    BridgeCalibrator(lines: lines, withSupportedOperations: ["*", "+"]).findSumOfSolveableTestValues()
  }
  
  static func partTwo(lines: [String]) -> Int {
    BridgeCalibrator(lines: lines, withSupportedOperations: ["||", "*", "+"]).findSumOfSolveableTestValues()
  }
}
