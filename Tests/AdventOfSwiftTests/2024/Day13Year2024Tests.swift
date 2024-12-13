import Testing
@testable import AdventOfSwift

class Day13Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day13Year2024.partOne(lines: Files.readExample(year: 2024, day: 13)) == 480)
  }
  
  @Test func partOne() async {
    #expect(Day13Year2024.partOne(lines: Files.readProblem(year: 2024, day: 13)) == 37901)
  }
  
  @Test func partTwoExample() async {
    #expect(Day13Year2024.partTwo(lines: Files.readExample(year: 2024, day: 13)) == 875318608908)
  }
  
  @Test func partTwo() async {
    #expect(Day13Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 13)) == 77407675412647)
  }
}
