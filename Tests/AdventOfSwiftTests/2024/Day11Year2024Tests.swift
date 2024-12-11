import Testing
@testable import AdventOfSwift

class Day11Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day11Year2024.partOne(lines: Files.readExample(year: 2024, day: 11)) == 55312)
  }
  
  @Test func partOne() async {
    #expect(Day11Year2024.partOne(lines: Files.readProblem(year: 2024, day: 11)) == 220999)
  }
  
  @Test func partTwoExample() async {
    #expect(Day11Year2024.partTwo(lines: Files.readExample(year: 2024, day: 11)) == 65601038650482)
  }
  
  @Test func partTwo() async {
    #expect(Day11Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 11)) == 261936432123724)
  }
}
