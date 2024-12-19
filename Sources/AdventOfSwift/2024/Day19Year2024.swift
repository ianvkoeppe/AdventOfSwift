class Day19Year2024 {
  class TowelArranger {
    let towels: [String]
    let designs: [String]
    var cache: [String:Int] = [:]
    
    init(lines: [String]) {
      let sections = lines.joined(separator: "\n").split(separator: "\n\n")
      self.towels = sections[0].split(separator: "\n")[0].split(separator: ", ").map(String.init)
      self.designs = sections[1].split(separator: "\n").map(String.init)
    }
    
    func countPossibleDesigns() -> Int { designs.count { designIsPossible(design: $0) >= 1 } }
    
    func countPossibleWaysToMakeDesigns() -> Int { designs.sum { designIsPossible(design: $0) } }
    
    private func designIsPossible(design: String) -> Int {
      if cache[design] != nil {
        return cache[design]!
      }
      
      if design.isEmpty {
        cache[design] = 1
      } else {
        let towels = towels.filter { design.starts(with: $0) }
        cache[design] = !towels.isEmpty ? towels.sum { designIsPossible(design: design.substring(after: $0)) } : 0
      }
      
      return cache[design]!
    }
  }
  
  static func partOne(lines: [String]) -> Int { TowelArranger(lines: lines).countPossibleDesigns() }
  
  static func partTwo(lines: [String]) -> Int { TowelArranger(lines: lines).countPossibleWaysToMakeDesigns() }
}
