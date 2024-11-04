import Foundation

class Files {
  static func readExample(year: Int, day: Int) -> [String] {
    return Files.read(year: year, day: day, filename: "example")
  }
  
  static func readProblem(year: Int, day: Int) -> [String] {
    return Files.read(year: year, day: day, filename: "problem")
  }
  
  private static func read(year: Int, day: Int, filename: String) -> [String] {
    return Bundle.module.url(forResource: "Resources/\(year)/\(day)/\(filename)", withExtension: "txt").map { url in
      try! String(contentsOf: url, encoding: .utf8).components(separatedBy: .newlines).filter { !$0.isEmpty }
    }!
  }
}
