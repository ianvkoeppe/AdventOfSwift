import ArgumentParser
import Cocoa

@main
struct Main: AsyncParsableCommand {
  @Option(name: .shortAndLong, help: "Year of the problem to setup.")
  private var year: Int
  
  @Option(name: .shortAndLong, help: "Day of the problem to setup.")
  private var day: Int
  
  @Flag(help: "Open the browser to the chosen problem.")
  private var openBrowser: Bool = false
  
  @Flag(help: "Force regeneration of classes even if they already exist.")
  private var force: Bool = false
  
  mutating func run() async throws { await Scaffolder.run(year, day, openBrowser, force) }
}
