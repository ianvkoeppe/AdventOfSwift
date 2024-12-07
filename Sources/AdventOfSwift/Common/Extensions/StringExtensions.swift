extension String {
  func asInts(separator: String = "") -> [Int] {
    self.split(separator: separator).compactMap { Int($0) }
  }
  
  func remove(suffix: String) -> String {
    self.hasSuffix(suffix) ? String(self.dropLast(suffix.count)) : self
  }
  
  func substring(after str: String, or: String? = nil) -> String {
    let index = self.range(of: str)?.upperBound
    return index.map { String(self[$0...]) } ?? or ?? self
  }
}
