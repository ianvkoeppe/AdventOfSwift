infix operator %%

extension Int {
  static func %%(numerator: Int, divisor: Int) -> Int {
    let remainder = numerator % divisor
    return remainder >= 0 ? remainder : remainder + divisor
  }
}
