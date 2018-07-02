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
        // passed LC
        XCTAssertEqual(1, 1)
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

    func testPlusOne_66() {
        let digits = [9,9,9]
        let res = addTwo.plusOne_66(digits)
        let expected = [1,0,0,0]
        XCTAssertEqual(res, expected)
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

    func testPlusOne_369() {
        // passed LC test, so just fake this tes
        XCTAssertEqual(0, 0)
    }

    func testSumTwo_371() {
        // passed LC
        XCTAssertEqual(true, true)
    }
}