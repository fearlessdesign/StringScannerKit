import XCTest

import ScannerExtensions

final class ScannerScanDataFromHexTests: XCTestCase {

  func testNibble() throws {
    let string = "A"
    let scanner = Scanner(string: string)
    let data = try XCTUnwrap(scanner.scanDataFromHex())
    XCTAssertEqual(data, Data([0xA]))
  }

  func testByte() throws {
    let string = "AB"
    let scanner = Scanner(string: string)
    let data = try XCTUnwrap(scanner.scanDataFromHex())
    XCTAssertEqual(data, Data([0xAB]))
  }

  func testByteAndNibble() throws {
    let string = "AB1"
    let scanner = Scanner(string: string)
    let data = try XCTUnwrap(scanner.scanDataFromHex())
    XCTAssertEqual(data, Data([0xAB, 0x1]))
  }

  func testMultipleBytes() throws {
    let string = "ABCDEF12"
    let scanner = Scanner(string: string)
    let data = try XCTUnwrap(scanner.scanDataFromHex())
    XCTAssertEqual(data, Data([0xAB, 0xCD, 0xEF, 0x12]))
  }

  func testNonHexCharacters() throws {
    let string = "-.123ABCDEF12"
    let scanner = Scanner(string: string)
    XCTAssertNil(scanner.scanDataFromHex())
    XCTAssertEqual(scanner.scanCharacter(), "-")  // Ensure we didn't lose any characters.
  }

  func testStopsAtNonHexCharacters() throws {
    let string = "ABCDEF12-.AB"
    let scanner = Scanner(string: string)
    let data = try XCTUnwrap(scanner.scanDataFromHex())
    XCTAssertEqual(data, Data([0xAB, 0xCD, 0xEF, 0x12]))
    XCTAssertEqual(scanner.scanCharacter(), "-")  // Ensure we didn't lose any characters.
  }
}
