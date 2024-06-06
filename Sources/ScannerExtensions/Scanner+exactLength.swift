import Foundation

extension Scanner {
  /// Scans exactly `exactLength` characters, or returns nil if it isn't possible.
  ///
  /// If there aren't `exactLength` characters in the result, then `nil` is returned. Any scanned characters will be lost.
  public func scanCharacters(exactLength: Int) -> String? {
    var characters: [Character] = []
    while characters.count < exactLength,
          let character = scanCharacter() {
      characters.append(character)
    }
    guard characters.count == exactLength else {
      return nil
    }
    return String(characters)
  }

  /// Scans exactly `exactLength` characters from `characterSet`, or returns nil if it isn't possible.
  ///
  /// If there aren't `exactLength` characters in the result, then `nil` is returned. Any scanned characters will be lost.
  public func scanCharacters(exactLength: Int, from characterSet: CharacterSet) -> String? {
    var characters: [Character] = []
    while characters.count < exactLength,
          let character = scanCharacter(),
          character.unicodeScalars.allSatisfy({ characterSet.contains($0) }) {
      characters.append(character)
    }
    guard characters.count == exactLength else {
      return nil
    }
    return String(characters)
  }
}
