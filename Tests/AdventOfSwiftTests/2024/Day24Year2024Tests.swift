import Testing
@testable import AdventOfSwift

class Day24Year2024Tests {
  @Test func partOneExample() async {
    #expect(Day24Year2024.partOne(lines: Files.readExample(year: 2024, day: 24)) == 2024)
  }
  
  @Test func partOne() async {
    #expect(Day24Year2024.partOne(lines: Files.readProblem(year: 2024, day: 24)) == 43942008931358)
  }
  
  @Test func partTwo() async {
    #expect(Day24Year2024.partTwo(lines: Files.readProblem(year: 2024, day: 24)) == "dvb,fhg,fsq,tnc,vcf,z10,z17,z39")
  }
}
