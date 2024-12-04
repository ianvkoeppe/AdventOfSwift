extension Array {
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }

  func sum<E>(of: (Self.Index, Element.Index) -> Int) -> Int where Element == Array<E> {
    self.indices.sum { y in self[y].indices.sum { x in of(x, y) } }
  }
}
