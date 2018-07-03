//
// Created by LW on 7/3/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class SubStrNoRepeatTests: LCBaseTest {
    private let subStrProblems = SubStrNoRepeat()

    func testSubStrNoRepeat_3() {
        let str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$"
        let res = subStrProblems.subStrNoRepeat_3(str)
        self.debugPrint(res, self.printClosure)
        let expected = 66
        XCTAssertEqual(res, expected)
    }
}
