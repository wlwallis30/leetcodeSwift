//
// Created by LW on 7/9/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class ZigZagTests: LCBaseTest {
    private let zigZag = ZigZag()

    func testZigZag_6() {
        let str = "PAYPALISHIRING"
        let nRows = 3
        let res = zigZag.zigZagConvert_6(str, nRows)
        let expected = "PAHNAPLSIIGYIR"
        XCTAssertEqual(res, expected)
    }
}