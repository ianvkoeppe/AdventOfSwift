import Testing
@testable import AdventOfSwift

class Day23Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day23Year2024.partOne(lines: Files.readExample(year: 2024, day: 23)) == 7)
  }
  
  @Test func partOne() async {
    #expect(Day23Year2024.partOne(lines: Files.readProblem(year: 2024, day: 23)) == 1218)
  }
  
  @Test func partTwoExample() async {
    #expect(Day23Year2024.partTwo(lines: Files.readExample(year: 2024, day: 23)) == "co,de,ka,ta")
  }
  
  @Test func partTwo() async {
    #expect(Day23Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 23)) == "ah,ap,ek,fj,fr,jt,ka,ln,me,mp,qa,ql,zg")
  }
}
