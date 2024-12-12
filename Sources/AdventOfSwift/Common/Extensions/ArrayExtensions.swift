extension Array {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
  
  subscript<E>(_ p: Point) -> E where Element == Array<E> {
    self[p.y][p.x]
  }

  subscript<E>(safe p: Point) -> E? where Element == Array<E> {
    self[safe: p.y]?[safe: p.x]
  }

  func firstIndices<E>(of: (Self.Index, Element.Index) -> Bool) -> (Element.Index, Element.Index)? where Element == Array<E> {
    self.indices.compactMap { y in
      let x = self[y].indices.first { x in of(x, y) }
      return x != nil ? (x!, y) : nil
    }.first
  }
  
  func indices<E>(of: (Self.Index, Element.Index) -> Bool) -> [(Element.Index, Element.Index)] where Element == Array<E> {
    self.indices.flatMap { y in
      self[y].indices.filter { x in of(x, y) }.map { x in (x, y) }
    }
  }

  func sum<E>(of: (Self.Index, Element.Index) -> Int) -> Int where Element == Array<E> {
    self.indices.sum { y in self[y].indices.sum { x in of(x, y) } }
  }
}
