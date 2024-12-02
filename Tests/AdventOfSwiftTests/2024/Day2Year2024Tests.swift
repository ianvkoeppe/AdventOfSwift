import Testing
@testable import AdventOfSwift

class Day2Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day2Year2024.partOne(lines: Files.readExample(year: 2024, day: 2)) == 2)
  }
  
  @Test func partOne() async {
    #expect(Day2Year2024.partOne(lines: Files.readProblem(year: 2024, day: 2)) == 524)
  }
  
  @Test func partTwoExample() async {
    #expect(Day2Year2024.partTwo(lines: Files.readExample(year: 2024, day: 2)) == 4)
  }
  
  @Test func partTwo() async {
    #expect(Day2Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 2)) == 569)
  }
}
