import Testing
@testable import AdventOfSwift

class Day5Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day5Year2024.partOne(lines: Files.readExample(year: 2024, day: 5)) == 143)
  }
  
  @Test func partOne() async {
    #expect(Day5Year2024.partOne(lines: Files.readProblem(year: 2024, day: 5)) == 5588)
  }
  
  @Test func partTwoExample() async {
    #expect(Day5Year2024.partTwo(lines: Files.readExample(year: 2024, day: 5)) == 123)
  }
  
  @Test func partTwo() async {
    #expect(Day5Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 5)) == 5331)
  }
}
