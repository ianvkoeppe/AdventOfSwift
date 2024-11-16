import Cocoa

struct AdventOfCodeClient {
  private static let domain: URL = URL(string: "https://www.adventofcode.com")!
  
  let session: String
  
  init(session: String) {
    self.session = session
  }
  
  private func problemInputUrl(year: Int, day: Int) -> URL { URL(string: "\(problemUrl(year: year, day: day))/input")! }
  
  func problemUrl(year: Int, day: Int) -> URL { URL(string: "\(AdventOfCodeClient.domain)/\(year)/day/\(day)")! }
  
  func getProblemInput(year: Int, day: Int) async -> String { await call(url: problemInputUrl(year: year, day: day)) }
  
  private func call(url: URL) async -> String {
    var request = URLRequest(url: url)
    request.setValue("session=\(session)", forHTTPHeaderField: "Cookie")
    return String(data: try! await URLSession.shared.data(for: request).0, encoding: .utf8)!
  }
}
