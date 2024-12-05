class Day5Year2024 {
  static func partOne(lines: [String]) -> Int {
    let (rules, pages) = parse(lines)
    return pages.filter { areCorrectOrder($0, basedOn: rules) }
      .sum { $0[$0.count / 2] }
  }
  
  static func partTwo(lines: [String]) -> Int {
    let (rules, pages) = parse(lines)
    return pages.filter { !areCorrectOrder($0, basedOn: rules) }
      .map { correctOrder(of: $0, basedOn: rules) }
      .sum { $0[$0.count / 2] }
  }
  
  private static func parse(_ lines: [String]) -> ([Int:Set<Int>], [[Int]]) {
    let sections = lines.joined(separator: "\n").split(separator: "\n\n").map(String.init)
    let rules = sections[0].split(separator: "\n")
      .map { String($0).asInts(separator: "|") }
      .map { ($0[0], $0[1]) }
      .reduce([Int:Set<Int>]()) { (rules, next) in
        let appended: Set = (rules[next.0] ?? []).union(Set([next.1]))
        return rules + (next.0, appended)
      }
    let resolved = Dictionary(uniqueKeysWithValues: rules.keys.map {
      key in (key, resolveDependencies(of: key, basedOn: rules))
    })
    
    let pages = sections[1].split(separator: "\n").map { String($0).asInts(separator: ",") }
    return (resolved, pages)
  }
  
  private static func resolveDependencies(of page: Int, basedOn rules: [Int:Set<Int>]) -> Set<Int> {
    let next = rules[page] ?? []
    return next.union(next.filter { !next.contains($0) }.flatMap { resolveDependencies(of: $0, basedOn: rules) })
  }

  private static func areCorrectOrder(_ pages: [Int], basedOn rules: [Int:Set<Int>]) -> Bool {
    return pages == correctOrder(of: pages, basedOn: rules)
  }

  private static func correctOrder(of pages: [Int], basedOn rules: [Int:Set<Int>]) -> [Int] {
    pages.reduce([Int]()) { fixed, page in
      let dependencies = rules[page] ?? []
      return fixed.filter { !dependencies.contains($0) } + [page] + fixed.filter { dependencies.contains($0) }
    }
  }
}
