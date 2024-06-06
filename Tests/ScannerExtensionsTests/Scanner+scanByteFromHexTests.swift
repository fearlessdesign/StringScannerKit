import XCTest

import ScannerExtensions

final class ScannerScanByteFromHexTests: XCTestCase {

  func testNibble() throws {
    let string = "A"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanByteFromHex())
  }

  func testByte() throws {
    let string = "AB"
    let scanner = Scanner(string: string)
    let byte = try XCTUnwrap(scanner.scanByteFromHex())
    XCTAssertEqual(byte, 0xAB)
  }

  func testByteAndNibble() throws {
    let string = "AB1"
    let scanner = Scanner(string: string)
    let byte = try XCTUnwrap(scanner.scanByteFromHex())
    XCTAssertEqual(byte, 0xAB)
  }

  func testMultipleBytes() throws {
    let string = "ABCDEF12"
    let scanner = Scanner(string: string)
    let byte = try XCTUnwrap(scanner.scanByteFromHex())
    XCTAssertEqual(byte, 0xAB)
  }

  func testNonHexCharacters() throws {
    let string = "-.123ABCDEF12"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanByteFromHex())
    XCTAssertEqual(scanner.scanCharacter(), ".")  // Confirm that we lost the first character.
  }

  func testStopsAtNonHexCharacters() throws {
    let string = "ABCDEF12-.AB"
    let scanner = Scanner(string: string)
    let data = try XCTUnwrap(scanner.scanByteFromHex())
    XCTAssertEqual(data, 0xAB)
    XCTAssertEqual(scanner.scanCharacter(), "C")
  }
}
