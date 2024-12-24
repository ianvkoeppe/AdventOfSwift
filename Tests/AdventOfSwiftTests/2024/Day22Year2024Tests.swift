import Testing
@testable import AdventOfSwift

class Day22Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day22Year2024.partOne(lines: Files.readExample(year: 2024, day: 22, filename: "example-1")) == 37327623)
  }
  
  @Test func partOne() async {
    #expect(Day22Year2024.partOne(lines: Files.readProblem(year: 2024, day: 22)) == 13584398738)
  }
  
  @Test func partTwoExample() async {
    #expect(Day22Year2024.partTwo(lines: Files.readExample(year: 2024, day: 22, filename: "example-2")) == 23)
  }
  
  @Test func partTwo() async {
    #expect(Day22Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 22)) == 1612)
  }
}
