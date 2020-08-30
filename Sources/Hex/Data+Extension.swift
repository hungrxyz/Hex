//
//  Data+Extension.swift
//  
//
//  Created by marko on 8/30/20.
//

import Foundation

public extension Data {

    func hexadecimalEncodedString(options: HexadecimalEncodingOptions = []) -> String {
        let encoder = HexadecimalEncoder(options: options)
        return encoder.encode(self)
    }

}
