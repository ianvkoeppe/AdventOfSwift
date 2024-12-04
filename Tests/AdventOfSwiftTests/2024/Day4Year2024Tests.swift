import Testing
@testable import AdventOfSwift

class Day4Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day4Year2024.partOne(lines: Files.readExample(year: 2024, day: 4)) == 18)
  }
  
  @Test func partOne() async {
    #expect(Day4Year2024.partOne(lines: Files.readProblem(year: 2024, day: 4)) == 2517)
  }
  
  @Test func partTwoExample() async {
    #expect(Day4Year2024.partTwo(lines: Files.readExample(year: 2024, day: 4)) == 9)
  }
  
  @Test func partTwo() async {
    #expect(Day4Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 4)) == 1960)
  }
}
