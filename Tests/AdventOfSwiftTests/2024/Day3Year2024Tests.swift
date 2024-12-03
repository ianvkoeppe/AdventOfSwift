import Testing
@testable import AdventOfSwift

class Day3Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day3Year2024.partOne(lines: Files.readExample(year: 2024, day: 3, filename: "example-1")) == 161)
  }
  
  @Test func partOne() async {
    #expect(Day3Year2024.partOne(lines: Files.readProblem(year: 2024, day: 3)) == 173731097)
  }
  
  @Test func partTwoExample() async {
    #expect(Day3Year2024.partTwo(lines: Files.readExample(year: 2024, day: 3, filename: "example-2")) == 48)
  }
  
  @Test func partTwo() async {
    #expect(Day3Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 3)) == 93729253)
  }
}
