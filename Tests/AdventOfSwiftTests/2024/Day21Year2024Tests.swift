import Testing
@testable import AdventOfSwift

class Day21Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day21Year2024.partOne(lines: Files.readExample(year: 2024, day: 21)) == 126384)
  }
  
  @Test func partOne() async {
    #expect(Day21Year2024.partOne(lines: Files.readProblem(year: 2024, day: 21)) == 157908)
  }
  
  @Test func partTwoExample() async {
    #expect(Day21Year2024.partTwo(lines: Files.readExample(year: 2024, day: 21)) == 154115708116294)
  }
  
  @Test func partTwo() async {
    #expect(Day21Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 21)) == 196910339808654)
  }
}
