class Day24Year2024 {
  private protocol LogicComponent {
    var name: String { get }
    func value() -> Bool
  }
  
  private struct Wire: LogicComponent {
    let name: String, bit: Bool
    func value() -> Bool { bit }
  }
  
  private class Gate: LogicComponent {
    let lhsName: String, op: String, rhsName: String, out: String
    var lhs: LogicComponent?, rhs: LogicComponent? = nil
    
    convenience init(lhsName: String, op: String, rhsName: String, out: String) {
      self.init(lhsName: lhsName, lhs: nil, op: op, rhsName: rhsName, rhs: nil, out: out)
    }
    
    init(lhsName: String, lhs: LogicComponent?, op: String, rhsName: String, rhs: LogicComponent?, out: String) {
      self.lhsName = lhsName
      self.lhs = lhs
      self.op = op
      self.rhsName = rhsName
      self.rhs = rhs
      self.out = out
    }
    
    var name: String { out }

    func value() -> Bool {
      let operations: [String:(Bool, Bool) -> Bool] = ["AND": { $0 && $1 }, "OR": { $0 || $1 }, "XOR": { $0 != $1 }]
      return operations[op]!(lhs!.value(), rhs!.value())
    }
    
    func compare(with expectation: Gate) -> [String] {
      if op == expectation.op && [expectation.lhsName, expectation.rhsName].allSatisfy({ $0 == "" || $0 == lhsName || $0 == rhsName }) {
        if [expectation.lhs, expectation.rhs].allSatisfy({ $0 != nil && !Set(["x", "y"]).contains($0!.name.first ?? " ") }) {
          let expected = [(lhs, expectation.lhs), (rhs, expectation.rhs)].flatMap { ($0.0 as! Gate).compare(with: $0.1 as! Gate) }
          let swapped = [(lhs, expectation.rhs), (rhs, expectation.lhs)].flatMap { ($0.0 as! Gate).compare(with: $0.1 as! Gate) }
          return expected.count < swapped.count ? expected : swapped
        }
        
        return []
      }
      
      return [out]
    }
  }
  
  private class Circuit {
    private let zWires: [LogicComponent]

    init(_ lines: [String]) {
      let sections = lines.joined(separator: "\n").split(separator: "\n\n")
      let wires: [String:LogicComponent] = Circuit.parseComponents(in: sections[0], by: ": ") { Wire(name: String($0[0]), bit: $0[1] == "1") }
      let gates: [String:Gate] = Circuit.parseComponents(in: sections[1], by: " ") { Gate(lhsName: String($0[0]), op: String($0[1]), rhsName: String($0[2]), out: String($0[4])) }
      gates.forEach { (name, component) in
        component.lhs = wires[component.lhsName] ?? gates[component.lhsName]!
        component.rhs = wires[component.rhsName] ?? gates[component.rhsName]!
      }
      self.zWires = wires.merging(gates) { $1 }.filter { $0.key.starts(with: "z") }.sorted(by: { $0.key < $1.key }).map { $0.value }
    }

    private static func parseComponents<LC: LogicComponent>(in section: String.SubSequence, by separator: String, creating builder: ([String]) -> LC) -> [String:LC] {
      Dictionary(uniqueKeysWithValues: section.split(separator: "\n").map {
        let component = builder($0.split(separator: separator).map { String($0) })
        return (component.name, component)
      })
    }
    
    func computeResultOfZWires() -> Int { Int(zWires.map { $0.value() }.map { $0 ? "1" : "0" }.reversed().joined(), radix: 2)! }

    func findSwappedWires() -> String {
      Set(zWires.indices.flatMap { z in (zWires[z] as! Gate).compare(with: buildAdditionGateExpectation(i: z)) }).sorted().joined(separator: ",")
    }
    
    private func buildAdditionGateExpectation(i: Int) -> Gate {
      let xName = String(format: "x%02d", i)
      let yName = String(format: "y%02d", i)
      
      switch i {
        case 0:
          return Gate(lhsName: xName, lhs: Wire(name: xName, bit: false), op: "XOR", rhsName: yName, rhs: Wire(name: yName, bit: false), out: "")
        case zWires.count - 1:
          return buildCarryOverExpectation(i: i - 1)
        default:
          let currentDigitXor = Gate(lhsName: xName, lhs: Wire(name: xName, bit: false), op: "XOR", rhsName: yName, rhs: Wire(name: yName, bit: false), out: "")
          return Gate(lhsName: "", lhs: currentDigitXor, op: "XOR", rhsName: "", rhs: buildCarryOverExpectation(i: i - 1), out: "")
      }
    }
    
    private func buildCarryOverExpectation(i: Int) -> Gate {
      let xName = String(format: "x%02d", i)
      let yName = String(format: "y%02d", i)
      
      switch i {
        case 0:
          return Gate(lhsName: xName, lhs: Wire(name: xName, bit: false), op: "AND", rhsName: yName, rhs: Wire(name: yName, bit: false), out: "")
        default:
          let x = Wire(name: xName, bit: false)
          let y = Wire(name: yName, bit: false)
          let currentDigitXor = Gate(lhsName: xName, lhs: x, op: "XOR", rhsName: yName, rhs: y, out: "")
          let carryOverAnd = Gate(lhsName: "", lhs: currentDigitXor, op: "AND", rhsName: "", rhs: nil, out: "")
          let currentDigitAnd = Gate(lhsName: "", lhs: x, op: "AND", rhsName: "", rhs: y, out: "")
          return Gate(lhsName: "", lhs: carryOverAnd, op: "OR", rhsName: "", rhs: currentDigitAnd, out: "")
      }
    }
  }
  
  static func partOne(lines: [String]) -> Int { Circuit(lines).computeResultOfZWires() }
  
  static func partTwo(lines: [String]) -> String { Circuit(lines).findSwappedWires() }
}
