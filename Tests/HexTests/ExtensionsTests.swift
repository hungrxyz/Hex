//
//  ExtensionsTests.swift
//  
//
//  Created by marko on 8/30/20.
//

import XCTest
import Hex

final class ExtensionsTests: XCTestCase {

    // MARK: Data

    /// Expected result generated with:
    /// `echo -n "I am hungry for data." | xxd -p`
    func testEncodeData_withNoOptions() {
        // given
        let data = Data("I am hungry for data.".utf8)
        let expectedResult = "4920616d2068756e67727920666f7220646174612e"

        // when
        let result = data.hexadecimalEncodedString()

        // then
        XCTAssertEqual(result, expectedResult)
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry for data." | xxd -p -u | sed 's/../& /g'`
    func testEncodeData_withUppercasedAndSeparateOctetsOptions() {
        // given
        let data = Data("I am hungry for data.".utf8)
        let expectedResult = "49 20 61 6D 20 68 75 6E 67 72 79 20 66 6F 72 20 64 61 74 61 2E"

        // when
        let result = data.hexadecimalEncodedString(
            options: [.uppercased, .separateOctetsWithWhitespace]
        )

        // then
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: StringProtocol

    /// Expected result generated with:
    /// `echo -n "I am hungry for text." | xxd -p`
    func testEncodeString_withNoOptions() {
        // given
        let string = "I am hungry for text."
        let expectedResult = "4920616d2068756e67727920666f7220746578742e"

        // when
        let result = string.hexadecimalEncodedString()

        // then
        XCTAssertEqual(result, expectedResult)
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry for text." | xxd -p -u | sed 's/../& /g'`
    func testEncodeSubstring_withUppercasedAndSeparateOctetsOptions() {
        // given
        let substring = Substring("I am hungry for text.")
        let expectedResult = "49 20 61 6D 20 68 75 6E 67 72 79 20 66 6F 72 20 74 65 78 74 2E"

        // when
        let result = substring.hexadecimalEncodedString(
            options: [.uppercased, .separateOctetsWithWhitespace]
        )

        // then
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: BinaryInteger

    func testEncodeInt_withNoOptions() {
        // given
        let int: Int = 0xFF
        let expectedResult = "ff"

        // when
        let result = int.hexadecimalEncodedString()

        // then
        XCTAssertEqual(result, expectedResult)
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry for text." | xxd -p -u | sed 's/../& /g'`
    func testEncodeUInt8_withUppercasedAndSeparateOctetsOptions() {
        // given
        let uInt8: UInt8 = 0xF0
        let expectedResult = "F0"

        // when
        let result = uInt8.hexadecimalEncodedString(
            options: [.uppercased, .separateOctetsWithWhitespace]
        )

        // then
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: BinaryInteger Array

    func testEncodeIntArray_withNoOptions() {
        // given
        let array: [Int] = [0x0a, 0x0b, 0x0c]
        let expectedResult = "0a0b0c"

        // when
        let result = array.hexadecimalEncodedString()

        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testEncodeUInt8Array_withUppercasedAndSeparateOctetsOptions() {
        // given
        let array: [UInt8] = [0x0d, 0x0e, 0x0f]
        let expectedResult = "0D 0E 0F"

        // when
        let result = array.hexadecimalEncodedString(
            options: [.uppercased, .separateOctetsWithWhitespace]
        )

        // then
        XCTAssertEqual(result, expectedResult)
    }
    
}
