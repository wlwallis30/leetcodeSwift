//
// Created by LW on 7/15/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class PalindromeTests: LCBaseTest {
    private let palindrome = PalinDrome()

    func testLongestPalinStr_5() {
        XCTAssertEqual(1, 1)
    }

    func testAnagramGroup_49() {
        var strs = ["eat","tea","tan","ate","nat","bat"]
        var res = palindrome.groupAnagram_49(strs)
        print(res)
        strs = ["bob", "boo"]
        res = palindrome.groupAnagram_49(strs)
        print(res)
        // all swift answers for long array are different in order with LC solution
        // it could be LC provide the c++ solution for all other lang
    }
}