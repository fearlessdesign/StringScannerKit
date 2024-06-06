import Foundation

extension Scanner {
  /// Scans for exactly two hexadecimal characters, returning the resulting byte if two characters were found.
  ///
  /// This method should only be used if it's expected that the next two characters in the string represent a hexadecimal byte, as
  /// characters will be lost if the characters are not hex values.
  ///
  /// If only one hexadecimal character is found, nil is returned and the scanned hexadecimal character is lost.
  public func scanByteFromHex() -> UInt8? {
    guard let characters = scanCharacters(exactLength: 2, from: .hexCharacters) else {
      return nil
    }
    return UInt8(characters, radix: 16)
  }
}
