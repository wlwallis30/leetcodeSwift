//
// Created by LW on 6/27/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation
import XCTest

class LCBaseTest: XCTestCase {
    let debug: Bool = true
    let resultStr = "result is: "
    let expectedStr = "expected is: "
    let expectedNotEqual = "not equal, expected is: "
    let expectedIntStr = "not equal, expected integer is: %d"
    let printClosure: (_ stuff: Any) -> Void = {
        stuff in
        if Mirror(reflecting: stuff).subjectType == Int.self {
            print("Integer is: ", stuff, "\n")
        } else if Mirror(reflecting: stuff).subjectType == String.self {
            print(stuff, "\n")
        }
    }

    override func setUp() {
        super.setUp()
        print("Init before each test...\n")
    }

    override func tearDown() {
        print("Done after each test\n")
        super.tearDown()
    }

    func printQuestionInfo(_ questionInfo: String) {
        if self.debug {
            print("-------Now Testing------>>", questionInfo, "\n")
        }
    }
    func debugPrint(_ stuff: Any, _ closure: (Any) -> Void) {
        if self.debug {
            closure(stuff)
        }
    }
}
