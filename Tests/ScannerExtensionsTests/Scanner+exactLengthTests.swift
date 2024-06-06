import XCTest

import ScannerExtensions

final class ScannerExactLengthTests: XCTestCase {

  // MARK: - Scan any characters

  func testNotEnoughCharacters() throws {
    let string = "A"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanCharacters(exactLength: 2))
  }

  func testEnoughCharacters() throws {
    let string = "AB"
    let scanner = Scanner(string: string)
    XCTAssertEqual(scanner.scanCharacters(exactLength: 2), "AB")
  }

  func testCharactersAreNotLost() throws {
    let string = "ABCD"
    let scanner = Scanner(string: string)
    XCTAssertEqual(scanner.scanCharacters(exactLength: 2), "AB")
    XCTAssertEqual(scanner.scanCharacter(), "C")
  }

  func testCharactersAreLostWhenNotEnough() throws {
    let string = "ABCD"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanCharacters(exactLength: 10))
    XCTAssertNil(scanner.scanCharacter())
  }

  // MARK: - Scan specific character sets

  func testCharacterSetWithNotEnoughCharacters() throws {
    let string = "A"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanCharacters(exactLength: 2, from: .alphanumerics))
  }

  func testCharacterSetWithEnoughCharacters() throws {
    let string = "AB"
    let scanner = Scanner(string: string)
    XCTAssertEqual(scanner.scanCharacters(exactLength: 2, from: .alphanumerics), "AB")
  }

  func testCharacterSetWithCharactersAreNotLost() throws {
    let string = "ABCD"
    let scanner = Scanner(string: string)
    XCTAssertEqual(scanner.scanCharacters(exactLength: 2, from: .alphanumerics), "AB")
    XCTAssertEqual(scanner.scanCharacter(), "C")
  }

  func testCharacterSetWithNonMatchingCharactersLosesCharacters() throws {
    let string = "1A2B"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanCharacters(exactLength: 1, from: .letters))
    XCTAssertEqual(scanner.scanCharacter(), "A")
  }
}
