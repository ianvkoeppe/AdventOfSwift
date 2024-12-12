import Testing
@testable import AdventOfSwift

class Day12Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day12Year2024.partOne(lines: Files.readExample(year: 2024, day: 12, filename: "example-1")) == 140)
    #expect(Day12Year2024.partOne(lines: Files.readExample(year: 2024, day: 12, filename: "example-2")) == 772)
    #expect(Day12Year2024.partOne(lines: Files.readExample(year: 2024, day: 12, filename: "example-3")) == 1930)
  }
  
  @Test func partOne() async {
    #expect(Day12Year2024.partOne(lines: Files.readProblem(year: 2024, day: 12)) == 1473620)
  }
  
  @Test func partTwoExample() async {
    #expect(Day12Year2024.partTwo(lines: Files.readExample(year: 2024, day: 12, filename: "example-1")) == 80)
    #expect(Day12Year2024.partTwo(lines: Files.readExample(year: 2024, day: 12, filename: "example-2")) == 436)
    #expect(Day12Year2024.partTwo(lines: Files.readExample(year: 2024, day: 12, filename: "example-3")) == 1206)
    #expect(Day12Year2024.partTwo(lines: Files.readExample(year: 2024, day: 12, filename: "example-4")) == 236)
    #expect(Day12Year2024.partTwo(lines: Files.readExample(year: 2024, day: 12, filename: "example-5")) == 368)
  }
  
  @Test func partTwo() async {
    #expect(Day12Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 12)) == 902620)
  }
}
