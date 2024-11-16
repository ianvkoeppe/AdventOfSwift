# Advent of Swift | ![Build](https://github.com/ianvkoeppe/AdventOfSwift/actions/workflows/build.yml/badge.svg)

Solutions for [adventofcode.com](https://adventofcode.com) in Swift.

## Scaffolding

**Command**

1. Login to [adventofcode.com](https://adventofcode.com) and copy your session cookie to `~/.aoc`. 
2. The following downloads your problem input to `Sources/AdventOfSwift/Resources` and generates skeleton classes and tests.
3. Unfortunately extracting example input isn't trivial, so you'll need to manually copy the example input into the generated `example.txt`.

```commandline
 > swift run Scaffolder --help
USAGE: main --year <year> --day <day> [--open-browser] [--force]

OPTIONS:
  -y, --year <year>       Year of the problem to setup.
  -d, --day <day>         Day of the problem to setup.
  --open-browser          Open the browser to the chosen problem.
  --force                 Force regeneration of classes even if they already exist.
  -h, --help              Show help information.
```

**Example Scaffolding**
```swift
class Day1Year2000 {
  static func partOne(lines: [String]) -> Int { 0 }
  
  static func partTwo(lines: [String]) -> Int { 0 }
}
```

```swift
import Testing
@testable import AdventOfSwift

class Day1Year2000Tests {
  @Test func partOneExample() async {
    #expect(Day1Year2000.partOne(lines: Files.readExample(year: 2000, day: 1)) == 0)
  }
  
  @Test func partOne() async {
    #expect(Day1Year2000.partOne(lines: Files.readProblem(year: 2000, day: 1)) == 0)
  }
  
  @Test func partTwoExample() async {
    #expect(Day1Year2000.partTwo(lines: Files.readExample(year: 2000, day: 1)) == 0)
  }
  
  @Test func partTwo() async {
    #expect(Day1Year2000.partTwo(lines: Files.readProblem(year: 2000, day: 1)) == 0)
  }
}
```
