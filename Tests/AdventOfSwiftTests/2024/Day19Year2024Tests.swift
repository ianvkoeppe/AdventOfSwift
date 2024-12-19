import Testing
@testable import AdventOfSwift

class Day19Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day19Year2024.partOne(lines: Files.readExample(year: 2024, day: 19)) == 6)
  }
  
  @Test func partOne() async {
    #expect(Day19Year2024.partOne(lines: Files.readProblem(year: 2024, day: 19)) == 333)
  }
  
  @Test func partTwoExample() async {
    #expect(Day19Year2024.partTwo(lines: Files.readExample(year: 2024, day: 19)) == 16)
  }
  
  @Test func partTwo() async {
    #expect(Day19Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 19)) == 678536865274732)
  }
}
