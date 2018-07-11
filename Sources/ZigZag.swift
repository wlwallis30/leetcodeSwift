//
// Created by LW on 7/9/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation

protocol ZigZagFunc {
}

class ZigZag: ZigZagFunc {
}

extension ZigZagFunc {
    func zigZagConvert_6(_ str: String, _ nRows: Int) -> String {
        if nRows < 2 { return str }
        let str = NSString(string: str)
        var res = ""
        let zigZagSize = nRows + nRows - 2
        for row in 0..<nRows {
            for base in stride(from: row, to: str.length, by: zigZagSize) {
                res += str.substring(with: NSRange(location: base, length: 1))
                let redIdx = base + zigZagSize - 2*row
                if row > 0 && row < nRows-1 && redIdx < str.length {
                    res += str.substring(with: NSRange(location: redIdx, length: 1))
                }
            }
        }

        return res
    }
}
