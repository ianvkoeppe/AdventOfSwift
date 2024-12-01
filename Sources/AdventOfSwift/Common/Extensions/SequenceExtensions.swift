extension Sequence where Element: Hashable {
  func grouping() -> [Element:[Element]] { self.grouping { $0 } }
  
  func grouping<K: Hashable>(by keyForValue: (Element) -> K) -> [K:[Element]] {
    Dictionary(grouping: self, by: keyForValue)
  }
}

extension Sequence where Element == Int {
  func sum(by: (Element) -> Int = { $0 }) -> Int {
    self.reduce(0) { $0 + by($1) }
  }
}
