extension String {
  func asInts(separator: String = "") -> [Int] {
    self.split(separator: separator).compactMap { Int($0) }
  }
}
