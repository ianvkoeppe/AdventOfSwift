import Testing
@testable import AdventOfSwift

class Day18Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day18Year2024.partOne(lines: Files.readExample(year: 2024, day: 18), takingFirst: 12) == 22)
  }
  
  @Test func partOne() async {
    #expect(Day18Year2024.partOne(lines: Files.readProblem(year: 2024, day: 18)) == 436)
  }
  
  @Test func partTwoExample() async {
    #expect(Day18Year2024.partTwo(lines: Files.readExample(year: 2024, day: 18)) == "6,1")
  }
  
  @Test func partTwo() async {
    #expect(Day18Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 18)) == "61,50")
  }
}
