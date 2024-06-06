import Foundation

extension Scanner {
  /// Scans for hexadecimal characters, returning the resulting string parsed as bytes if any hex characters were found.
  public func scanDataFromHex() -> Data? {
    let characters = scanCharacters(from: .hexCharacters)
    return characters?.hexData
  }
}

extension StringProtocol {
  /// Parses the string as hexadecimal bytes and returns the result as Data.
  fileprivate var hexData: Data {
    return .init(sequence(state: startIndex) { startIndex in
      guard startIndex < endIndex else {
        return nil
      }
      let endIndex = index(startIndex, offsetBy: 2, limitedBy: endIndex) ?? endIndex
      defer {
        startIndex = endIndex
      }
      return UInt8(self[startIndex..<endIndex], radix: 16)
    })
  }
}
