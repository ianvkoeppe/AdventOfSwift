import Foundation

class Day11Year2024 {
  struct StoneAndBlinks: Hashable {
    let stone, blinks: Int
  }
  
  class StoneCounter {
    let initial: [Int]
    var stoneCountAfterBlinks: [StoneAndBlinks:Int] = [:]
    
    init(lines: [String]) {
      self.initial = lines[0].asInts(separator: " ")
    }
    
    func blink(times blinks: Int) -> Int {
      initial.sum { blink(stoneAndBlinks: StoneAndBlinks(stone: $0, blinks: blinks)) }
    }
    
    private func blink(stoneAndBlinks stone: StoneAndBlinks) -> Int {
      if stoneCountAfterBlinks[stone] != nil || stone.blinks == 0 {
        return stoneCountAfterBlinks[stone] ?? 1
      }
      
      stoneCountAfterBlinks[stone] = singleBlink(stone: stone.stone)
        .sum { next in blink(stoneAndBlinks: StoneAndBlinks(stone: next, blinks: stone.blinks - 1)) }
      return stoneCountAfterBlinks[stone]!
    }
    
    private func singleBlink(stone: Int) -> [Int] {
      if stone == 0 {
        return [1]
      } else if String(stone).count % 2 == 0 {
        let str = String(stone)
        let middleIndex = str.index(str.startIndex, offsetBy: str.count / 2)
        return [String(str[..<middleIndex]), String(str[middleIndex...])].compactMap(Int.init)
      } else {
        return [stone * 2024]
      }
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    StoneCounter(lines: lines).blink(times: 25)
  }
  
  static func partTwo(lines: [String]) -> Int {
    StoneCounter(lines: lines).blink(times: 75)
  }
}
