import Foundation

extension CharacterSet {
  static let hexCharacters = Self.decimalDigits.union(CharacterSet(charactersIn: "abcdefABCDEF"))
}

