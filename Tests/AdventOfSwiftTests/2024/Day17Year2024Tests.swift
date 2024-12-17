import Testing
@testable import AdventOfSwift

class Day17Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day17Year2024.partOne(lines: Files.readExample(year: 2024, day: 17, filename: "example-1")) == "4,6,3,5,6,3,5,2,1,0")
  }
  
  @Test func partOne() async {
    #expect(Day17Year2024.partOne(lines: Files.readProblem(year: 2024, day: 17)) == "2,1,0,4,6,2,4,2,0")
  }
  
  @Test func partTwoExample() async {
    #expect(Day17Year2024.partTwo(lines: Files.readExample(year: 2024, day: 17, filename: "example-2")) == 117440)
  }
  
  @Test func partTwo() async {
    #expect(Day17Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 17)) == 109685330781408)
  }
}
