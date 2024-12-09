import Testing
@testable import AdventOfSwift

class Day9Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day9Year2024.partOne(lines: Files.readExample(year: 2024, day: 9)) == 1928)
  }
  
  @Test func partOne() async {
    // High: 8183694578038
    #expect(Day9Year2024.partOne(lines: Files.readProblem(year: 2024, day: 9)) == 6242766523059)
  }
  
  @Test func partTwoExample() async {
    #expect(Day9Year2024.partTwo(lines: Files.readExample(year: 2024, day: 9)) == 2858)
  }
  
  @Test func partTwo() async {
    #expect(Day9Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 9)) == 6272188244509)
  }
}
