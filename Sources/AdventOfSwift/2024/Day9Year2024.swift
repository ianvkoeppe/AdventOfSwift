class Day9Year2024 {
  struct File: Hashable {
    let id, size: Int
  }
  
  class Disk {
    let files: [File]
    let spaces: [Int]
    
    init(lines: [String]) {
      let diskMap = lines[0].map(String.init).compactMap(Int.init)
      self.files = diskMap.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }.enumerated().map(File.init)
      self.spaces = diskMap.enumerated().filter { $0.offset % 2 == 1 }.map { $0.element }
    }
    
    init(files: [File]) {
      self.files = files
      self.spaces = []
    }
    
    func compactWithFragmentation() -> Disk {
      compact(files) { (files, _) in files.removeLast() }
    }
    
    func compactWithNoFragmentation() -> Disk {
      compact(files) { (files, remainder) in
        if let index = files.lastIndex(where: { $0.size <= remainder && $0.id > 0 }) {
          let last = files[index]
          files[index] = File(id: 0, size: last.size)
          return last
        }
        
        return nil
      }
    }
    
    private func compact(_ files: [File], andSelector selector: (inout [File], Int) -> File?) -> Disk {
      var (files, spaces) = (files, spaces)
      
      var compacted: [File] = []
      while !files.isEmpty {
        compacted.append(files.removeFirst())
        
        if !spaces.isEmpty {
          var remainder = spaces.removeFirst()
          
          while !files.isEmpty && remainder > 0 {
            if let file = selector(&files, remainder) {
              if file.size <= remainder {
                compacted.append(file)
              } else {
                compacted.append(File(id: file.id, size: remainder))
                files.append(File(id: file.id, size: file.size - remainder))
              }
            } else {
              compacted.append(File(id: 0, size: remainder))
            }
            
            remainder -= compacted.last!.size
          }
        }
      }
      
      return Disk(files: compacted)
    }

    func checkSum() -> Int {
      files.reduce((index: 0, sum: 0)) { (indexAndSum, file) in
        let n = indexAndSum.index + (file.size - 1)
        let sumOfIndices = (n * (n + 1) / 2) - ((indexAndSum.index - 1) * (indexAndSum.index) / 2)
        return (indexAndSum.index + file.size, indexAndSum.sum + sumOfIndices * file.id)
      }.sum
    }
  }
  
  static func partOne(lines: [String]) -> Int {
    Disk(lines: lines).compactWithFragmentation().checkSum()
  }
  
  static func partTwo(lines: [String]) -> Int {
    Disk(lines: lines).compactWithNoFragmentation().checkSum()
  }
}
