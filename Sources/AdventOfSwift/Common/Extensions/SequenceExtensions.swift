extension Sequence {
  func compactJoined(_ by: (Element) -> String?, separator: String = "") -> String {
    self.compactMap(by).joined(separator: separator)
  }
  
  func flatten<E>() -> [E] where Element == E? {
    self.compactMap { $0 }
  }
  
  func grouping() -> [Element:[Element]] where Element: Hashable {
    self.grouping { $0 }
  }
  
  func grouping<K: Hashable>(by keyForValue: (Element) -> K) -> [K:[Element]] {
    Dictionary(grouping: self, by: keyForValue)
  }
  
  func joined(_ by: (Element) -> String, separator: String = "") -> String {
    self.map(by).joined(separator: separator)
  }
  
  func anySatisfies(_ predicate: (Element) -> Bool) -> Bool {
    first(where: predicate) != nil
  }

  func satisfiesInEitherDirection(_ predicate: ([Element]) -> Bool) -> Bool {
    [self as! [Element], reversed()].anySatisfies(predicate)
  }
  
  func sum(of: (Element) -> Int = { $0 }) -> Int where Element == Int {
    self.reduce(0) { $0 + of($1) }
  }

  func sum(of: (Element) -> Int) -> Int {
    return self.map(of).sum()
  }
  
  func zipWithNext() -> Zip2Sequence<Self, DropFirstSequence<Self>> {
    zip(self, dropFirst())
  }
}
