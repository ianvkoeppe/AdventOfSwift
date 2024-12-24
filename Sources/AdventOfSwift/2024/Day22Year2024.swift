class Day22Year2024 {
  static func partOne(lines: [String]) -> Int { lines.compactMap(Int.init).sum { nextNSecretNumbers(after: $0).last! } }
  
  static func partTwo(lines: [String]) -> Int {
    let numbers: [Int] = lines.compactMap(Int.init)
    return numbers.reduce([Int:Int]()) { (pricesByPreceedingSequences, number) in
      let prices = nextNSecretNumbers(after: number).map { $0 % 10 }
      let diffs = prices.zipWithNext().map { $1 - $0 }
      
      var thisMonkeysSequences: [Int:Int] = [:]
      for index in (0..<(diffs.endIndex - 4)) {
        let sequence = diffs[index..<(index + 4)].reduce(1) { (total, next) in total * 11 + next }
        if thisMonkeysSequences[sequence] == nil {
          thisMonkeysSequences[sequence] = prices[index + 4]
        }
      }
      
      return pricesByPreceedingSequences.merging(thisMonkeysSequences, uniquingKeysWith: +)
    }.values.max()!
  }
  
  private static func nextNSecretNumbers(after number: Int, n: Int = 2000) -> [Int] {
    n == 0 ? [number] : [number] + nextNSecretNumbers(after: nextSecretNumber(after: number), n: n - 1)
  }
  
  private static func nextSecretNumber(after n: Int) -> Int {
    let one = ((n * 64) ^ n) % 16777216
    let two = ((one / 32) ^ one) % 16777216
    return ((two * 2048) ^ two) % 16777216
  }
}
