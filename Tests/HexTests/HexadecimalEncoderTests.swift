//
//  HexadecimalEncoderTests.swift
//  
//
//  Created by marko on 8/21/20.
//

import XCTest
import Hex

final class HexadecimalEncoderTests: XCTestCase {

    private let iAmHungry = "I am hungry."

    private var encoder: HexadecimalEncoder!

    override func setUp() {
        encoder = HexadecimalEncoder()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        encoder = nil
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry." | xxd -p`.
    func testEncodeSimpleSentence_withDefaultEncodingOptions_shouldEncodeAsExpected() {
        // given
        let sentence = iAmHungry
        let expectedResult = "4920616d2068756e6772792e"
        encoder.options = []

        // when
        let result = encoder.encode(sentence)

        // then
        XCTAssertEqual(result, expectedResult)
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry." | xxd -p -u`.
    func testEncodeSimpleSentence_withUppercasedOption_shouldEncodeAsExpected() {
        // given
        let sentence = iAmHungry
        let expectedResult = "4920616D2068756E6772792E"
        encoder.options = .uppercased

        // when
        let result = encoder.encode(sentence)

        // then
        XCTAssertEqual(result, expectedResult)
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry." | xxd -p | sed 's/../& /g'`.
    func testEncodeSimpleSentence_withSeparateOctetsOption_shouldEncodeAsExpected() {
        // given
        let sentence = iAmHungry
        let expectedResult = "49 20 61 6d 20 68 75 6e 67 72 79 2e"
        encoder.options = .separateOctetsWithWhitespace

        // when
        let result = encoder.encode(sentence)

        // then
        XCTAssertEqual(result, expectedResult)
    }

    /// Expected result generated with:
    /// `echo -n "I am hungry." | xxd -p | sed 's/../& /g'`.
    func testEncodeSimpleSentence_withUppercasedAndSeparateOctetsOptions_shouldEncodeAsExpected() {
        // given
        let sentence = iAmHungry
        let expectedResult = "49 20 61 6D 20 68 75 6E 67 72 79 2E"
        encoder.options = [.uppercased, .separateOctetsWithWhitespace]

        // when
        let result = encoder.encode(sentence)

        // then
        XCTAssertEqual(result, expectedResult)
    }

    static var allTests = [
        (
            "testEncodeSimpleSentence_withDefaultEncodingOptions_shouldEncodeAsExpected",
            testEncodeSimpleSentence_withDefaultEncodingOptions_shouldEncodeAsExpected
        ),
        (
            testEncodeSimpleSentence_withUppercasedOption_shouldEncodeAsExpected,
            "testEncodeSimpleSentence_withUppercasedOption_shouldEncodeAsExpected"
        ),
        (
            testEncodeSimpleSentence_withSeparateOctetsOption_shouldEncodeAsExpected,
            "testEncodeSimpleSentence_withSeparateOctetsOption_shouldEncodeAsExpected"
        ),
        (
            testEncodeSimpleSentence_withUppercasedAndSeparateOctetsOptions_shouldEncodeAsExpected,
            "testEncodeSimpleSentence_withUppercasedAndSeparateOctetsOptions_shouldEncodeAsExpected"
        )
    ]
    
}
