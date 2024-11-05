import Testing
@testable import AdventOfSwift

class Day1Tests {
  @Test func testPartOneExample() async {
    #expect(Day1.partOne(lines: Files.readExample(year: 2024, day: 1)) == 1)
  }
  
  @Test func testPartOne() async {
    #expect(Day1.partOne(lines: Files.readProblem(year: 2024, day: 1)) == 1)
  }
  
  @Test func testPartTwoExample() async {
    #expect(Day1.partTwo(lines: Files.readExample(year: 2024, day: 1)) == 1)
  }
  
  @Test func testPartTwo() async {
    #expect(Day1.partTwo(lines: Files.readProblem(year: 2024, day: 1)) == 1)
  }
}
