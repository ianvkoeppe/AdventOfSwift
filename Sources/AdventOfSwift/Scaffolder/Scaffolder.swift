import ArgumentParser
import Cocoa

struct Scaffolder {
  private static let mainSources: String = "Sources/AdventOfSwift/"
  private static let testSources: String = "Tests/AdventOfSwiftTests/"
  private static let client: AdventOfCodeClient = AdventOfCodeClient(
    session: Files.readString(from: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(".aoc"))
  )
  
  static func run(_ year: Int, _ day: Int, _ openBrowser: Bool, _ force: Bool) async {
    generateClassFiles(for: year, onDay: day, force: force)
    generateTestFiles(for: year, onDay: day, force: force)
    await generateInputFiles(for: year, onDay: day)
    
    if openBrowser {
      NSWorkspace.shared.open(client.problemUrl(year: year, day: day))
    }
  }
  
  private static func generateClassFiles(for year: Int, onDay day: Int, force: Bool) {
    let path = URL(fileURLWithPath: mainSources + "/\(year)/Day\(day)Year\(year).swift")
    if FileManager.default.fileExists(atPath: path.path()) && !force {
      print("Skipping \(path.path()) as it already exists.")
      return
    }
    
    let template = renderTemplate(path: URL(fileURLWithPath: "\(mainSources)/Resources/Day.txt"), year: year, day: day)
    Files.writeStringCreatingDirectories(template, to: path)
  }
  
  private static func generateTestFiles(for year: Int, onDay day: Int, force: Bool) {
    let path = URL(fileURLWithPath: testSources + "/\(year)/Day\(day)Year\(year)Tests.swift")
    if FileManager.default.fileExists(atPath: path.path()) && !force {
      print("Skipping \(path.path()) as it already exists.")
      return
    }
    
    let template = renderTemplate(path: URL(fileURLWithPath: "\(mainSources)/Resources/DayTests.txt"), year: year, day: day)
    Files.writeStringCreatingDirectories(template, to: path)
  }
  
  private static func renderTemplate(path: URL, year: Int, day: Int) -> String {
    let template = try! String(contentsOf: path, encoding: .utf8)
    let templateReplacements = ["{year}": "\(year)", "{day}": "\(day)"]
    return templateReplacements.keys.reduce(template) { t, k -> String in
      t.replacingOccurrences(of: k, with: templateReplacements[k]!)
    }
  }
  
  private static func generateInputFiles(for year: Int, onDay day: Int) async {
    let problemInput = await client.getProblemInput(year: year, day: day)
    Files.writeStringCreatingDirectories(problemInput, to: URL(fileURLWithPath: mainSources + "/Resources/\(year)/\(day)/problem.txt"))
    Files.writeStringCreatingDirectories("", to: URL(fileURLWithPath: mainSources + "/Resources/\(year)/\(day)/example.txt"))
  }
}
