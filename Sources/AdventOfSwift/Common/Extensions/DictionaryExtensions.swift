extension Dictionary {
  static func +(lhs: Dictionary, rhs: (Key, Value)) -> Dictionary {
    return lhs.merging(Dictionary(uniqueKeysWithValues: [rhs]), uniquingKeysWith: { $1 })
  }
  
  func eachCount() -> [Key:Int] where Value == Array<Key> {
    self.mapValues { $0.count { _ in true } }
  }
}
