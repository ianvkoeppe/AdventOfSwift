import Testing
@testable import AdventOfSwift

class Day8Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day8Year2024.partOne(lines: Files.readExample(year: 2024, day: 8)) == 14)
  }
  
  @Test func partOne() async {
    #expect(Day8Year2024.partOne(lines: Files.readProblem(year: 2024, day: 8)) == 252)
  }
  
  @Test func partTwoExample() async {
    #expect(Day8Year2024.partTwo(lines: Files.readExample(year: 2024, day: 8)) == 34)
  }
  
  @Test func partTwo() async {
    #expect(Day8Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 8)) == 839)
  }
}
