//
//  HexadecimalEncoder.swift
//  
//
//  Created by marko on 8/21/20.
//

import Foundation

public struct HexadecimalEncodingOptions: OptionSet {

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let uppercased = HexadecimalEncodingOptions(rawValue: 1 << 0)

    public static let separateOctetsWithWhitespace = HexadecimalEncodingOptions(rawValue: 1 << 1)
}

public class HexadecimalEncoder {

    public var options: HexadecimalEncodingOptions

    public init(options: HexadecimalEncodingOptions = []) {
        self.options = options
    }

    public func encode(_ data: Data) -> String {
        let bytes = [UInt8](data)
        return encode(bytes)
    }

    public func encode<T>(_ utf8String: T) -> String where T: StringProtocol {
        let bytes = [UInt8](utf8String.utf8)
        return encode(bytes)
    }

    public func encode<T>(_ binaryInteger: T) -> String where T: BinaryInteger {
        let bytes = [binaryInteger]
        return encode(bytes)
    }

    public func encode<T>(_ bytes: [T]) -> String where T: BinaryInteger {
        let uppercase = options.contains(.uppercased)

        let string = bytes
            .map { $0.hexEncoded(uppercase: uppercase) }
            .joined(separator: options.separator)

        return string
    }

}

private extension BinaryInteger {

    func hexEncoded(uppercase: Bool) -> String {
        let encoded = String(self, radix: 16, uppercase: uppercase)
        let leftNibble = self >> 4

        // Padding a "0" in case value is less that 16 which means
        // value is too small to fill the left nibble.
        if leftNibble == 0 {
            return "0\(encoded)"
        } else {
            return encoded
        }
    }

}

private extension HexadecimalEncodingOptions {

    var separator: String {
        contains(.separateOctetsWithWhitespace) ? " " : ""
    }

}

