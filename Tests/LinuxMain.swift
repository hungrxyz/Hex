import XCTest

import HexTests

var tests = [XCTestCaseEntry]()
tests += HexadecimalEncoderTests.allTests()
XCTMain(tests)
