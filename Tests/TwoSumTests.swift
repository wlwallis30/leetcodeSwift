//
// Created by LW on 6/19/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest
@testable import LeetcodeSwift

class TwoSumTests: LCBaseTest {
    private let twoSum = TwoSum()

    func testTwoSum_1() {
        let nums = [2, 7, 11, 15]
        let target = 9
        let res = twoSum.twoSum_1(nums: nums, target: target)
        let expected = [0, 1]
        printQuestionInfo("two sum @1")
        self.debugPrint(res.description, self.printClosure)
        self.debugPrint(expected.description, self.printClosure)
        XCTAssertEqual(res, expected)
    }

    func testThreeSum_15() {
        let nums = [-1, 0, 1, 2, -1, -4]
        let res = twoSum.threeSum_15(numbers: nums)
        let expected = [[-1, -1, 2], [-1, 0, 1]]
        self.printQuestionInfo("three sum @15")
        self.debugPrint(res.description, self.printClosure)
        self.debugPrint(expected.description, self.printClosure)
        XCTAssertEqual(res, expected)
    }

    func testThreeSumClosest_16() {
        var nums = [-1, 2, 1, -4]
        var target = 1
        var res = twoSum.threeSum_16(numbers: nums, target: target)
        var expected = 2

        self.printQuestionInfo("three sum closest @16")
        self.debugPrint(expected.description, self.printClosure)
        self.debugPrint(res.description, self.printClosure)
        XCTAssertEqual(res, expected)
        nums = [3,-2,-5,3,-4]
        target = -1
        expected = -2
        res = twoSum.threeSum_16(numbers: nums, target: target)
        self.debugPrint(expected, self.printClosure)
        self.debugPrint(res, self.printClosure)
    }

    func testFourSum_18() {
    var nums = [-1, 0, 1, 2, -2, 0]
    var target = 0
    var res = twoSum.fourSum_18(numbers: nums, target: target)
    var expected = [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]

    self.printQuestionInfo("four sum @18")
    self.debugPrint(expected.description, self.printClosure)
    self.debugPrint(res.description, self.printClosure)
    XCTAssertEqual(expected, res)

    nums =  [0, 0, 0, 0]
    target = 1
    res = twoSum.fourSum_18(numbers: nums, target: target)
    expected = []
    XCTAssertEqual(expected, res)

    nums = [-1,-5,-5,-3,2,5,0,4]
    target = -7
    expected = [[-5,-5,-1,4], [-5,-3,-1,2]]
    res = twoSum.fourSum_18(numbers: nums, target: target)
    XCTAssertEqual(expected, res)
    }

    func testTwoSum_167() {
    let nums = [2, 7, 11, 15]
    let target = 9
    let res = twoSum.twoSumSorted_167(nums: nums, target: target)
    let expected = [1, 2]

    self.printQuestionInfo("two sum @167")
    XCTAssertEqual(expected, res)
    }

    func testTwoSum_170() {
        let obj = TwoSum()
        obj.add(num: 1)
        obj.add(num: 3)
        obj.add(num: 5)
        obj.add(num: 4)
        obj.add(num: 7)
        var res = obj.find(target: 9)
        XCTAssertTrue(res)
        res = obj.find(target: 10)
        XCTAssertTrue(res)
        res = obj.find(target: 11)
        XCTAssertTrue(res)
        res = obj.find(target: 12)
        XCTAssertTrue(res)
        res = obj.find(target: 13)
        XCTAssertTrue(!res)
    }

    func testTwuSum_653() {
        let treeNode5 = TreeNode(5)
        let treeNode3 = TreeNode(3)
        let treeNode6 = TreeNode(6)
        let treeNode2 = TreeNode(2)
        let treeNode4 = TreeNode(4)
        let treeNode7 = TreeNode(7)

        treeNode5.left = treeNode3
        treeNode5.right = treeNode6
        treeNode3.left = treeNode2
        treeNode3.right = treeNode4
        treeNode6.left = treeNode7

        XCTAssertTrue(twoSum.twoSumBST_653(treeNode5, 9))
        XCTAssertTrue(twoSum.twoSumBST_653(treeNode5, 10))
        XCTAssertTrue(twoSum.twoSumBST_653(treeNode5, 6))
        XCTAssertTrue(twoSum.twoSumBST_653(treeNode5, 11))
        XCTAssertTrue(!twoSum.twoSumBST_653(treeNode5, 19))
    }

    func testThreeSumSmaller_259() {
        let nums = [-2, 0, 1, 3]
        let res = twoSum.threeSumSmaller_259(nums, 2)
        XCTAssertEqual(res, 2)
    }
}
