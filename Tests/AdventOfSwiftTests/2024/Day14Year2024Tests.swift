import Testing
@testable import AdventOfSwift

class Day14Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day14Year2024.partOne(lines: Files.readExample(year: 2024, day: 14), xSize: 11, ySize: 7) == 12)
  }
  
  @Test func partOne() async {
    #expect(Day14Year2024.partOne(lines: Files.readProblem(year: 2024, day: 14)) == 211773366)
  }
  
  @Test func partTwo() async {
    #expect(await Day14Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 14)) == 7344)
  }
}
