//
// Created by LW on 6/27/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class AddTwoNumTests: LCBaseTest {
    private let addTwo = AddTwoNums()

    func testAddBinary_67() {
        let str1 = "1010"
        let str2 = "1011"
        let res = addTwo.addBinary(str1, str2)
        let expected = "10101"
        self.debugPrint(res, self.printClosure)
        self.debugPrint(expected, self.printClosure)
        XCTAssertEqual(res, expected)
    }
}