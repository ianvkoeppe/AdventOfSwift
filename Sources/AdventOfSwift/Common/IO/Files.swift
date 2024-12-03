import Foundation

class Files {
  static func readExample(year: Int, day: Int, filename: String = "example") -> [String] {
    Files.read(year: year, day: day, filename: filename)
  }
  
  static func readProblem(year: Int, day: Int) -> [String] {
    Files.read(year: year, day: day, filename: "problem")
  }
  
  private static func read(year: Int, day: Int, filename: String) -> [String] {
    Bundle.module.url(forResource: "Resources/\(year)/\(day)/\(filename)", withExtension: "txt").map { url in
      Files.readString(from: url).components(separatedBy: .newlines)
    }!
  }
  
  static func readString(from path: URL) -> String { try! String(contentsOf: path, encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines) }
  
  static func writeStringCreatingDirectories(_ string: String, to path: URL) {
    try! FileManager.default.createDirectory(atPath: path.deletingLastPathComponent().path(), withIntermediateDirectories: true)
    try! string.write(to: path, atomically: true, encoding: .utf8)
  }
}
