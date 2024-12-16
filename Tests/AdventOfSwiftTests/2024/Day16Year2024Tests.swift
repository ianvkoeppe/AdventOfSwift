import Testing
@testable import AdventOfSwift

class Day16Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day16Year2024.partOne(lines: Files.readExample(year: 2024, day: 16, filename: "example-1")) == 7036)
    #expect(Day16Year2024.partOne(lines: Files.readExample(year: 2024, day: 16, filename: "example-2")) == 11048)
  }
  
  @Test func partOne() async {
    #expect(Day16Year2024.partOne(lines: Files.readProblem(year: 2024, day: 16)) == 99460)
  }
  
  @Test func partTwoExample() async {
    #expect(Day16Year2024.partTwo(lines: Files.readExample(year: 2024, day: 16, filename: "example-1")) == 45)
    #expect(Day16Year2024.partTwo(lines: Files.readExample(year: 2024, day: 16, filename: "example-2")) == 64)
  }
  
  @Test func partTwo() async {
    #expect(Day16Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 16)) == 500)
  }
}
