import Testing
@testable import AdventOfSwift

class Day20Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day20Year2024.partOne(lines: Files.readExample(year: 2024, day: 20)) == 0)
  }
  
  @Test func partOne() async {
    #expect(Day20Year2024.partOne(lines: Files.readProblem(year: 2024, day: 20)) == 1395)
  }
  
  @Test func partTwoExample() async {
    #expect(Day20Year2024.partTwo(lines: Files.readExample(year: 2024, day: 20)) == 0)
  }
  
  @Test func partTwo() async {
    #expect(Day20Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 20)) == 993178)
  }
}
