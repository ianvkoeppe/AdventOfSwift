class Day23Year2024 {
  static func partOne(lines: [String]) -> Int {
    let groups = findGroups(computers: parse(lines))
    return groups.filter { $0.count == 3 }.filter { group in group.anySatisfies { $0.starts(with: "t") } }.count
  }
  
  static func partTwo(lines: [String]) -> String {
    let groups = findGroups(computers: parse(lines))
    return groups.max { $0.count < $1.count }!.sorted().joined(separator: ",")
  }
  
  private static func parse(_ lines: [String]) -> [String:Set<String>] {
    lines.flatMap { line in
      let comps = line.split(separator: "-")
      return [(comps[0], comps[1]), (comps[1], comps[0])]
    }.grouping(by: { String($0.0) }).mapValues { Set($0.map { String($1) }) }
  }
  
  private static func findGroups(computers: [String:Set<String>]) -> Set<Set<String>> {
    return computers.keys.reduce(Set(computers.keys.map { Set([$0]) })) { (groups, computer) in
      groups.union(groups.filter { group in group.isSubset(of: computers[computer]!) }.map { group in Set(group + [computer]) })
    }
  }
}
