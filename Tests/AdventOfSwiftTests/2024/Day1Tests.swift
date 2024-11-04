import XCTest
@testable import AdventOfSwift

class Day1Tests: XCTestCase {
  func testPartOneExample() async {
    measure {
      XCTAssertEqual(Day1.partOne(lines: Files.readExample(year: 2024, day: 1)), 1)
    }
  }
  
  func testPartOne() async {
    measure {
      XCTAssertEqual(Day1.partOne(lines: Files.readProblem(year: 2024, day: 1)), 1)
    }
  }
  
  func testPartTwoExample() async {
    measure {
      XCTAssertEqual(Day1.partTwo(lines: Files.readExample(year: 2024, day: 1)), 1)
    }
  }
  
  func testPartTwo() async {
    measure {
      XCTAssertEqual(Day1.partTwo(lines: Files.readProblem(year: 2024, day: 1)), 1)
    }
  }
}
