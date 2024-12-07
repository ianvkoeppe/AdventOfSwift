import Testing
@testable import AdventOfSwift

class Day7Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day7Year2024.partOne(lines: Files.readExample(year: 2024, day: 7)) == 3749)
  }
  
  @Test func partOne() async {
    #expect(Day7Year2024.partOne(lines: Files.readProblem(year: 2024, day: 7)) == 3351424677624)
  }
  
  @Test func partTwoExample() async {
    #expect(Day7Year2024.partTwo(lines: Files.readExample(year: 2024, day: 7)) == 11387)
  }
  
  @Test func partTwo() async {
    #expect(Day7Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 7)) == 204976636995111)
  }
}
