//
// Created by LW on 6/19/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class TwoSumTests: XCTestCase {
    private var debug: Bool
    private var twoSum: TwoSum
    private var resultStr: String
    private var expectedStr: String
    private var expectedNotEqual: String
    private  var expectedIntStr: String

    override func setUp() {
        self.debug = true
        self.twoSum = TwoSum()
        self.resultStr = "result is: "
        self.expectedStr = "expected is: "
        self.expectedNotEqual = "not equal, expected is: "
        self.expectedIntStr = "not equal, expected integer is: %d"

        print("Init before each test...")
    }

    override func tearDown() {
        print("Done after each test")
    }

    private func debugPrint(message: String) {
        if self.debug {
            print(message)
        }
    }

    private func debugPrint(number: Int) {
        if self.debug {
            print("Integer is: ", number)
        }
    }
}

