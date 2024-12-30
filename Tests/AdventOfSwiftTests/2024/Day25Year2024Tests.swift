import Testing
@testable import AdventOfSwift

class Day25Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day25Year2024.partOne(lines: Files.readExample(year: 2024, day: 25)) == 3)
  }
  
  @Test func partOne() async {
    #expect(Day25Year2024.partOne(lines: Files.readProblem(year: 2024, day: 25)) == 3317)
  }
}
