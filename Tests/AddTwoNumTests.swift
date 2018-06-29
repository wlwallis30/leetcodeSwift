//
// Created by LW on 6/27/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class AddTwoNumTests: LCBaseTest {
    private let addTwo = AddTwoNums()

    func testAddTwo_2() {

    }

    func testMultiplyNums_43() {
        var num1 = "2"
        var num2 = "3"
        var res = addTwo.multiplyTwoStrs_43(num1, num2)
        XCTAssertEqual(res, "6")
        num1 = "0"
        num2 = "0"

        res = addTwo.multiplyTwoStrs_43(num1, num2)
        XCTAssertEqual(res,"0")
    }

    func testAddBinary_67() {
        let str1 = "1010"
        let str2 = "1011"
        let res = addTwo.addBinary_67(str1, str2)
        let expected = "10101"
        self.debugPrint(res, self.printClosure)
        self.debugPrint(expected, self.printClosure)
        XCTAssertEqual(res, expected)
    }
}
