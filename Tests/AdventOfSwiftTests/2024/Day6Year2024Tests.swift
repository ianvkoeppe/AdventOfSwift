import Testing
@testable import AdventOfSwift

class Day6Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day6Year2024.partOne(lines: Files.readExample(year: 2024, day: 6)) == 41)
  }
  
  @Test func partOne() async {
    #expect(Day6Year2024.partOne(lines: Files.readProblem(year: 2024, day: 6)) == 5318)
  }
  
  @Test func partTwoExample() async {
    #expect(Day6Year2024.partTwo(lines: Files.readExample(year: 2024, day: 6)) == 6)
  }
  
  @Test func partTwo() async {
    #expect(Day6Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 6)) == 1831)
  }
}
