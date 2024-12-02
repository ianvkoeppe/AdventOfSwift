extension Sequence where Element: Hashable {
  func grouping() -> [Element:[Element]] {
    self.grouping { $0 }
  }
  
  func grouping<K: Hashable>(by keyForValue: (Element) -> K) -> [K:[Element]] {
    Dictionary(grouping: self, by: keyForValue)
  }
  
  func satisfiesAny(_ predicate: (Element) -> Bool) -> Bool {
    first(where: predicate) != nil
  }

  func satisfiesInEitherDirection(_ predicate: ([Element]) -> Bool) -> Bool {
    [self as! [Element], reversed()].satisfiesAny(predicate)
  }
  
  func zipWithNext() -> Zip2Sequence<Self, DropFirstSequence<Self>> {
    zip(self, dropFirst())
  }
}

extension Sequence where Element == Int {
  func sum(by: (Element) -> Int = { $0 }) -> Int {
    self.reduce(0) { $0 + by($1) }
  }
}
