import Testing
@testable import AdventOfSwift

class Day15Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day15Year2024.partOne(lines: Files.readExample(year: 2024, day: 15, filename: "example-1")) == 2028)
    #expect(Day15Year2024.partOne(lines: Files.readExample(year: 2024, day: 15, filename: "example-2")) == 10092)
  }
  
  @Test func partOne() async {
    #expect(Day15Year2024.partOne(lines: Files.readProblem(year: 2024, day: 15)) == 1465152)
  }
  
  @Test func partTwoExample() async {
    #expect(Day15Year2024.partTwo(lines: Files.readExample(year: 2024, day: 15, filename: "example-2")) == 9021)
    #expect(Day15Year2024.partTwo(lines: Files.readExample(year: 2024, day: 15, filename: "example-3")) == 618)
  }
  
  @Test func partTwo() async {
    #expect(Day15Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 15)) == 1511259)
  }
}
