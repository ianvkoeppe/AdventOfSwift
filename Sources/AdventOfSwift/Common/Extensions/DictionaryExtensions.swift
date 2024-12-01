extension Dictionary where Value: Sequence {
  func eachCount() -> [Key:Int] {
    self.mapValues { $0.count { _ in true } }
  }
}
