import Testing
@testable import AdventOfSwift

class Day10Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day10Year2024.partOne(lines: Files.readExample(year: 2024, day: 10)) == 36)
  }
  
  @Test func partOne() async {
    #expect(Day10Year2024.partOne(lines: Files.readProblem(year: 2024, day: 10)) == 550)
  }
  
  @Test func partTwoExample() async {
    #expect(Day10Year2024.partTwo(lines: Files.readExample(year: 2024, day: 10)) == 81)
  }
  
  @Test func partTwo() async {
    #expect(Day10Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 10)) == 1255)
  }
}
