extension String {
  func asInts(separator: String = "") -> [Int] {
    self.split(separator: separator).compactMap { Int($0) }
  }
  
  func substringAfter(_ str: String, or: String? = nil) -> String {
    let index = self.range(of: str)?.upperBound
    return index.map { String(self[$0...]) } ?? or ?? self
  }
}
